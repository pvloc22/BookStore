const homeGet = require('../../../model/client/home.model')
const UpdateBook = require('../../../model/librarian/updateBookLibrarian.model')

class UpdateBookAdminControllers {

    UpdateBookLibrarianGet(req, res) {
        homeGet.findBook(req.params.slug,(err, data)=>{
            if(err){
                res.redirect('/erro')
                return
            }

            if(data[0].length <= 0){
                res.redirect('/erro')
                return
            }
            else{
                const url_auth = {pass: req.session.user.password}
                res.render('UpdateBookAdmin', { layout: 'Admin_Layout.hbs', data: data[0][0], URL_AUTH: url_auth});
        }})
    }
    
    UpdateBookLibrarianPut(req, res){
        UpdateBook.UpdateInforBook(req.body, (err, data)=>{
            if(err) res.json({err: true, data: null})
            else res.json({err: false, data: data})
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

module.exports = new UpdateBookAdminControllers;