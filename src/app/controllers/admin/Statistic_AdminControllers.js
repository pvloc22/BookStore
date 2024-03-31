const getTran = require('../../../model/admin/Statistic_AdminGet.model')

class Statistic_AdminControllers {
    Statistic_AdminGet(req, res) {
        const url_auth = {pass: req.session.user.password}
        res.render('Statistic_Admin', { layout: 'Admin_Layout.hbs',URL_AUTH: url_auth});
    }
    Statistic_AdminGetTransaction(req,res) {
        getTran.GetTransaction((err, data)=>{
            if(err){
                res.json({err: true, data: null})
            }
            else res.json({err: false, data})
        })
    }
    check_token(req, res, next){
        try {
            const token = req.params.token
            const token_ss = req.session.user.password
            if(token == token_ss)
            {
                next()
                return
            }
            throw 'Token not compare'
        } catch (error) {
            res.redirect('/erro')
        }
    }
}

module.exports = new Statistic_AdminControllers;