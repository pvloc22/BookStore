const viewProfileModelModel = require('../../../model/client/ViewProfile.model')

class AdminAccountUpdateControllers {
    AdminAccountUpdateGet(req, res) {
        const url_auth = { pass: req.session.user.password }

        viewProfileModelModel.GetInfoClient(req.session.user.username, (err, data) => {
            if (err) { res.json({ err: true }); return }
            else{
                if (data[0].length > 0) {
                    try {
                        res.render('AccountUpdate', { layout: 'Admin_Layout.hbs', URL_AUTH: url_auth, data: data[0][0]});
                    } catch (error) {
                        res.render('/erro')
                    }
                    return
                }
                res.render('/erro')
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
module.exports = new AdminAccountUpdateControllers;