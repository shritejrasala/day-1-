namespace com.nnrg.marketdb;
using {managed, cuid } from '@sap/cds/common';

@assert.unique:{
    bpno:[bpno]
}
entity Bussiness_Partner: cuid ,managed {
    
    @title:'Bussiness Partner Number' 
    bpno: Association to Unique_BPNUM;
    @title:'City'
    city:String(20) ;
    @title:'Name'
    name: String(50) ;
    @title:'State'
    state: String(20);
    @title:'Address1'
    Address1:String(50) ;
    @title:'Address2'
    Address2:String(50);
    @title:'PIN Code'
    pin :String(50) ;
    @title:'GSTIN Number'
    gstn:String(20);
    @title:'Is gstn Registered'
    is_gstn_registered: Boolean default false;
    @title:'Is Vendor'
    is_vendor: Boolean default false;
    @title:'Is Customer'
    is_customer: Boolean default false;
}

@cds.persistence.skip
entity State {
    @title: 'Code'
    code: String(3);
    @title: 'Description'
    description: String(50); //hello
    
}
entity Store : cuid, managed {
    @title: 'StoreID'
    store_id: Association to Unique_SID ;
    @title: 'Name'
    name: String(30) ;
    @title: 'Address1'  
    Address1:String(50);
    @title: 'Adress2'
    Address2:String(40);
    @title:'City'
    city:String(50);
    @title: 'State'
    state:String(20);
    @title: 'PIN Code.'
    pin: String(30);
}


entity Product : cuid, managed {
    @title: 'ProductID'
    product_id: Association to Unique_PID;
    @title: 'Product Name'
    product_name: String(20) ;
    @title: 'Product Image URL'
    product_img: String;
    @title: 'Product Cost Price'
    product_cost: Integer;
    @title: 'Product Sell Price'
    product_sell: Integer ;
}
entity Stock : cuid, managed {
    @title: 'StoreID'
    store_id: Association to Unique_SID;
    @title: 'ProductID'
    product_id: Association to Unique_PID ;
    @title: 'Stock QTY'  
    stock_qty:Association to Unique_Qty;
}
entity Unique_SID : cuid, managed {
    @title: 'code'
    code: String;
    @title: 'description'
    description: String;
}
entity Unique_PID : cuid, managed {
    @title: 'code'
    code: String;
    @title: 'description'
    description: String;
}
entity Purchase : cuid, managed {
    @title: 'Purchase Order Number'
    pono: String;
    @title: 'Bussiness Partner'
    Unique_BPNUM: Composition of many{
        key ID:UUID;
        bpno:Association to Unique_BPNUM;
    }
    @title: 'Purchase Order Date'  
    pod:Date;
    @title:'ProductID'
    Unique_PID: Composition of many{
        key ID:UUID;
        product_id:Association to Unique_PID;
    } 
    @title:'StoreID'
    Unique_SID: Composition of many{
        key ID:UUID;
        store_id:Association to Unique_SID;
    }
    @title: 'Price'  
    price:Integer; 
    @title:'Quantity'
    Unique_Qty: Composition of many{
        key ID:UUID;
        stock_qty:Association to Unique_Qty;
    } 
}
entity Unique_BPNUM : cuid, managed {
    @title: 'code'
    code: String;
    @title: 'description'
    description: String;
}

entity Unique_Qty : cuid, managed {
    @title: 'code'
    code: String;
    @title: 'description'
    description: String;
}
