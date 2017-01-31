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

        public int GetProductCountInStock(int supplierItemId)
        {
            StockCard card = db.StockCards.Where(s => s.ItemID == supplierItemId).FirstOrDefault();
            if (card == null) throw new ArgumentException("supplierItemID is not Valid");

                return card.OnHandQuantity.Value;
          
        }

      

      
        public StockCard GetStockCardByItemId(int ItemId)
        {
            StockCard card = db.StockCards.Where(s => s.ItemID == ItemId).FirstOrDefault();
            return card;
        }


    }
}