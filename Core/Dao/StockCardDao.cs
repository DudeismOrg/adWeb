﻿using LogicUniversityStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LogicUniversityStore.Dao
{
    public class StockCardDao
    {
        public LogicUniStoreModel db = new LogicUniStoreModel();

        public StockCardDao()
        {
            
        }

        public List<StockCard> GetAllInStock()
        {
            return db.StockCards.ToList();
        }

        public int GetProductCountInStock(int itemID)
        {
            StockCard card = db.StockCards.Where(s => s.ItemID == itemID).FirstOrDefault();
            if (card == null)
            {
                Item item = db.Items.Find(itemID);
                if ( item != null)
                {
                    StockCard c = new StockCard();
                    c.ItemID = itemID;
                    c.OnHandQuantity = 0;
                    c.Remarks = "Valid";
                    db.StockCards.Add(c);
                    db.SaveChanges();
                }else
                {
                    throw new ArgumentException("Item Id  is not Valid");
                }
            }
                return card.OnHandQuantity.Value;
          
        }

        internal void updateStockCardByPurchaseDelivery(Item item, int receivedQuantity)
        {
            StockCard stock = db.StockCards.Where(i => i.ItemID == item.ItemID).FirstOrDefault();
            int currentOnhandQty = stock.OnHandQuantity.HasValue ? stock.OnHandQuantity.Value : 0;
            stock.OnHandQuantity = currentOnhandQty + receivedQuantity;
            db.SaveChanges();
        }

        public void UpdateItemInStock(int itemID, int Quantity)
        {
            StockCard card = GetStockCardByItemId(itemID);
            if(card == null) throw new ArgumentException("Item Id  is not Valid");
            card.OnHandQuantity += Quantity;
            if (card.OnHandQuantity < 0) throw new InvalidOperationException("On hand quanity for ItemID " + itemID + " is going negative. ItemName: " + card.Item.ItemName);
            db.SaveChanges();
        }

      
        public StockCard GetStockCardByItemId(int ItemId)
        {
            StockCard card = db.StockCards.Where(s => s.ItemID == ItemId).FirstOrDefault();
            return card;
        }

        public void updateStockCardByAdjustment(int itemId, int adjustQuantity)
        {
            StockCard card = db.StockCards.Where(x => x.ItemID == itemId).FirstOrDefault();
            int qty = card.OnHandQuantity.Value + adjustQuantity;
            if (qty >= 0)
            {
                card.OnHandQuantity = qty;
                db.SaveChanges();
            }
        }

    }
}