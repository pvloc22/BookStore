const { render } = require('node-sass');
const modelGetBook = require('../../../model/client/home.model')


class ViewBookLibrarianControllers {
    ViewBookLibrarianSearch(req, res){
        const titlle = req.body.search
        modelGetBook.searchBook(titlle, (err, data)=>{
            if(err) res.json({err: true, data: null})
            else res.json({err: null, data: data.recordsets})
        })
    }
    ViewBookLibrarianGet(req, res) {
        modelGetBook.Getbook((err, data) => {
            try {
                if (err) res.redirect('/erro')
                else{
                    const url_auth = {pass: req.session.user.password}
                    res.render('ViewBookLibrarian', { layout: 'Librarian_Layout.hbs', data: data[0],URL_AUTH: url_auth});
                } 
            } catch (error) {
                res.rendirect('/erro')
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
    viewInfoBookLibrarian(req, res) {
        modelGetBook.findBook(req.params.slug, (err, data) => {
            try {
                if (err) res.rendirect('/erro')
                else {
                    const url_auth = {pass: req.session.user.password}
                    res.render('ViewBookInforLibrarian', { layout: 'Librarian_Layout.hbs', data: data[0][0], URL_AUTH: url_auth});
                }
                
            } catch (error) {
                res.redirect('/erro')
            }

        })
    }
}

module.exports = new ViewBookLibrarianControllers;