const viewProfileModelModel = require('../../../model/client/ViewProfile.model')

class ViewProfileLibrarianControllers {
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
    ViewProfileLibrarianGet(req, res) {
        viewProfileModelModel.GetInfoClient(req.session.user.username,(err, data)=>{
            if(err) {res.json({err:true}); return}
            if(data[0].length > 0){
                try {
                    const url_auth = {pass: req.session.user.password}
                    res.render('ViewProfileLibrarian', { layout: 'Librarian_Layout.hbs', data: data[0][0], URL_AUTH:{pass: req.session.user.password}, URL_AUTH: url_auth });  
                } catch (error) {
                    res.render('/erro')
                }
                return
            }
            res.json({err: true})
        })

    }
}

module.exports = new ViewProfileLibrarianControllers;