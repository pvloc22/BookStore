
class AdminViewProfileLibrarianControllers {
    AdminViewProfileLibrarianGet(req, res) {
        const url_auth = {pass: req.session.user.password}
        res.render('AdminViewProfileLibrarian', { layout: 'Admin_Layout.hbs', URL_AUTH: url_auth});
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

module.exports = new AdminViewProfileLibrarianControllers;