const homeGet = require('../../../model/client/home.model')
const UpdateBook = require('../../../model/librarian/updateBookLibrarian.model')

class UpdateBookLibrarianControllers {
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
                res.render('UpdateBookLibrarian', { layout: 'Librarian_Layout.hbs', data: data[0][0], URL_AUTH: url_auth});
        }})
    }
    
    UpdateBookLibrarianPut(req, res){
        UpdateBook.UpdateInforBook(req.body, (err, data)=>{
            if(err) res.json({err: true, data: null})
            else res.json({err: false, data: data})
        })
    }
}

module.exports = new UpdateBookLibrarianControllers;