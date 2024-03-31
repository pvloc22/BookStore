class Add_book_adminControllers {
    Add_book_adminGet(req, res) {
        const url_auth = {pass: req.session.user.password}
        res.render('Add_book_admin', { layout: 'Admin_Layout.hbs', URL_AUTH:url_auth });
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

module.exports = new Add_book_adminControllers;