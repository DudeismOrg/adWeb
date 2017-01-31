namespace LogicUniversityStore.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RequisitionItem")]
    [Serializable]
    public partial class RequisitionItem : IEquatable<RequisitionItem>
    {
        [Key]
        public int ReqItemID { get; set; }

        public int ReqID { get; set; }

        public int ItemID { get; set; }

        public int? NeededQuantity { get; set; }

        public int? ApprovedQuantity { get; set; }
        public int? RetirevedQuantity { get; set; }

        public int? DisbursedQuantity { get; set; }

        public int? DisbursementID { get; set; }
        public int? RetrievalID { get; set; }

        public bool? IsOutstanding { get; set; }

        public virtual Disbursement Disbursement { get; set; }

        public virtual Requisition Requisition { get; set; }

        public virtual SupplierItem SupplierItem { get; set; }

        public virtual Retrieval Retrieval { get; set; }

        public Category GetCategory()
        {
            return this.SupplierItem.Item.Category;
        }

        public Item GetItem()
        {
            return this.SupplierItem.Item;
        }
        public Department GetDepartment()
        {
            return this.Requisition.Department;
        }

        public bool Equals(RequisitionItem other)
        {
            return this.ItemID.Equals(other.ItemID);
        }
        public override int GetHashCode()
        {
            return this.ItemID;
        }
        public override string ToString()
        {
            return this.GetItem().ItemName;
        }
    }
}
