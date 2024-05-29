const cds = require('@sap/cds');
const moment = require('moment');

module.exports = class Service extends cds.ApplicationService {

    async init () {

        const {ProductsSet, InventorySet, ReviewsSet, BusinessPartner, Supplier} = this.entities;
        const external = await cds.connect.to("API_BUSINESS_PARTNER");

        this.on('READ', BusinessPartner, async req=>{
            return await external.transaction(req).send({
                query: req.query,
                headers: {
                    apikey: process.env.API_KEY
                }
            });
        });

        this.on('READ', Supplier, async req=>{
            return await external.transaction(req).send({
                query: req.query,
                headers: {
                    Authorization: process.env.API_KEY
                }
            });
        });


        this.before("NEW", ReviewsSet.drafts, async req=>{
            console.log("Estoy creando una nueva reseña");
            console.log(req.data);
            req.data.date = moment().format("YYYY-MM-DD");
            console.log(req.data);
        });

        this.after('UPDATE', ProductsSet.drafts, async req => {
            console.log("Ya termino la actualizacion");
            if (req.Statu_Code) {
                switch (req.Statu_Code) {
                    case 'In Stock': 
                        await update(req.ID, 3);
                    console.log("Actualizando a: 3");
                    break;
                    case 'Not In Stock':
                        await update(req.ID, 1);
                    console.log("Actualizando a: 1");
                    break;
                    case 'Low availability':
                        await update(req.ID, 2);
                        console.log("Actualizando a: 2");
                    break;
                }
            }
        }); 

        this.before('NEW', ProductsSet.drafts, async req => {
            console.log("Estoy creando un nuevo registro");
           req.data.Supplier??= {
                Supplier: "",
                SupplierName: "",
                WebAddress: "",
                Contact: {
                    FullName: "",
                    Email: "",
                    PhoneNumber: ""
                }
           };
        });

        this.before('NEW', InventorySet.drafts, async req => {
            console.log(req.data);
            const oSearch  = await SELECT.one.from(InventorySet.drafts).columns(`max(StockNumber) as Max`).where({Product_ID: req.data.Product_ID});
            console.log(oSearch);
            req.data.StockNumber = Number(oSearch.Max) + 1;
        });

        return super.init();
    };

};

async function update(ID, iInteger) {
    return await cds.run(UPDATE.entity`ProductService.ProductsSet.drafts`.set({Criticality: iInteger}).where({ID: ID}));
};
