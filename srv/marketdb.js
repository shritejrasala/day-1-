const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {

    const { State, Product, Bussiness_Partner,Purchase} = this.entities();
    this.on("READ", Bussiness_Partner, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
    this.before("CREATE",  Bussiness_Partner, async (req) => {
        const { bpno, is_gstn_registered, gstn } = req.data;
        if (is_gstn_registered && !gstn) {
            req.error({
                code: "MISSING_GST_NUM",
                message: "GSTIN number is mandatory when is_gstn_registered is true",
                target: "gstn",
            });
        }
    });
    
    
    this.before("CREATE",  Bussiness_Partner, async (req) => {
        const { bpno,is_gstn_registered, gstn } = req.data;
    
        if (gstn && !is_gstn_registered) {
            req.error({
                code: "MISSING_is_gstn_registered",
                message: "is_gstn_registered is mandatory when GSTIN number is given",
                target: "is_gstn_registered",
            });
        }
    });
    
    
    this.on("READ", Product, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
    this.before(['CREATE'], Product, async(req) => {
        
        const { product_sell, product_cost } = req.data;
        if (product_sell <= product_cost ) {
            req.error({
                'code': 'INVALID_SELLING_PRICE',
                'message': 'Selling price must be greater than the cost price',
                'target': 'product_sell'
            });
        }
    });

    

    this.on('READ', State, async(req) => {
        states = [
            {"code":"TS", "description":"Telangana"},
            {"code":"AP", "description":"AndhraPradesh"},
            {"code":"UP", "description":"UttarPradesh"},
            {"code":"MP", "description":"MadhyaPradesh"}
        ]
        states.$count=states.length;
        return states;
    });

});