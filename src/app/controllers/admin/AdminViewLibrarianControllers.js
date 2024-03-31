const viewLibrarianModel = require('../../../model/admin/AdminViewLibrarian.model')
class AdminViewLibrarianControllers {
    AdminViewLibrarianGet(req, res) {
        viewLibrarianModel.viewLibrarian((err, data) => {
            if (err) res.redirect('erro')
            else {
                const url_auth = {pass: req.session.user.password}
                res.render('AdminViewLibrarian', { layout: 'Admin_Layout.hbs', data: data, URL_AUTH: url_auth});
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
module.exports = new AdminViewLibrarianControllers;
