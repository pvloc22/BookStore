const modelGetBook = require('../../../model/client/home.model')


class AdminViewBookInforControllers {
    async AdminViewBookInforGet(req, res) {
        modelGetBook.findBook(req.params.BID, (err, data) => {
            try {
                if (err) res.rendirect('/erro')
                else {
                    const url_auth = {pass: req.session.user.password}
                    res.render('AdminViewBookInfor', { layout: 'Admin_Layout.hbs', data: data[0][0], URL_AUTH: url_auth});
                }
                
            } catch (error) {
                res.redirect('/erro')
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

module.exports = new AdminViewBookInforControllers;