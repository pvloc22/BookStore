const listBookGet = require('../../../model/client/home.model')
class AdminViewBookControllers {
    AdminViewBookGet(req, res) {
        const url_auth = {pass: req.session.user.password}
        listBookGet.Getbook((err, data)=>{
            if(err) console.log(err)
            else{
                try {
                    const url_auth = {pass: req.session.user.password}
                    res.render('AdminViewBook', {layout: 'Admin_Layout.hbs', data: data[0], URL_AUTH: url_auth});
                } catch (error) {
                    res.redirect('/erro')
                }
            }
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

module.exports = new AdminViewBookControllers;