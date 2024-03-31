const dashBoardGet = require('../../../model/librarian/DashboardLibrarian.model')

class DashboardLibrarianControllers {
    DashboardLibrarianGet(req, res) {
        dashBoardGet.getTranS((err, data)=>{
            if(err) res.redirect('/erro')
            else{
                const url_auth = {pass: req.session.user.password}
                res.render('DashboardLibrarian', { layout: 'Librarian_Layout.hbs', data, URL_AUTH: url_auth});
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
    DashboardLibrarianGetSlug(req, res){

        dashBoardGet.getConfirmTrans(req.params.slug, (err, data)=>{
            try {
                if(err) res.redirect('/erro')
                else{
                    const url_auth = {pass: req.session.user.password}
                    res.render('ConfirmReturnLibrarian', { layout: 'Librarian_Layout.hbs', data:data, URL_AUTH: url_auth});
                }
            } catch (error) {
                res.redirect('/erro')
            }
        })
    }

}

module.exports = new DashboardLibrarianControllers;