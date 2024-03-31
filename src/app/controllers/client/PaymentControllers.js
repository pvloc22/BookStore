const paymentModel = require('../../../model/client/payment.model')
const bcrypt = require('bcrypt')

class PaymentControllers {
    PaymentGet(req, res) {
        const url_auth = {pass: req.session.user.password}

        paymentModel.readDetailTrans(req.session.user.id, (err, data)=>{
            if(err) res.redirect('/erro')
            else{
                res.render('Payment', { layout: 'Client_Layout.hbs', URL_AUTH: url_auth, data: data, username:req.session.user.username, TID_: data.length === 0 ? -1:data[0].TID});
            }
        })

    }
    async insertBookToCart(req, res){

        paymentModel.insertBookTocart(req.body.UID, req.body.BID, (err, data)=>{
            if(err) res.json({err: true})
            else{
                res.json({err: false})
            }
        })
    }
    async removeBookToCart(req,res){
        paymentModel.removeBookToCartModel(req.body.TID, req.body.BID,(err, data)=>{
            if(err){
                console.log(err)
                res.json({err: true})
            }
            else res.json({err: false})
        })
    }

    async paymentBookToCart(req,res){
        paymentModel.paymentBookToCartModel(req.body.TID, (err, data)=>{
            if(err){
                console.log(err)
                res.json({err: true})
            }
            else res.json({err: false})
        })
    }
    async checkPassword(req, res){
        paymentModel.checkPasswordModel(req.body.username, (err,data)=>{
            if(err) res.json({err: true})
            else{
                if(bcrypt.compareSync(req.body.password, data.PASSWORD))
                {
                    res.json({err: false})
                    return
                }
                res.json({err: true})
            }
        })
    }

}

module.exports = new PaymentControllers;

