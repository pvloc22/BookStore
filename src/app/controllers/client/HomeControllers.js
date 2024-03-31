const bcrypt = require('bcrypt');
const homeGet = require('../../../model/client/home.model')


class HomeControllers {
    async home(req,res){
        homeGet.Getbook((err, data)=>{
            if(err) console.log(err)
            else{
                try {
                    const url_auth = {pass: req.session.user.password}
                    res.render('home', {layout: 'Client_Layout.hbs', data: data[0], URL_AUTH: url_auth});
                } catch (error) {
                    res.redirect('/erro')
                }
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
    async show(req, res){
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
                res.render('choosebook', { layout: 'Client_Layout.hbs', data: data[0][0], URL_AUTH: url_auth, favorites:{BID: req.params.slug, UID: req.session.user.id}});
        }})

    }
    searchPost(req,res){
        const titlle = req.body.search
        homeGet.searchBook(titlle, (err, data)=>{
            if(err) res.json({err: true, data: null})
            else res.json({err: null, data: data.recordsets})
        })

    }
    
    homeLogout(req, res){
        if(req.session.user)
        {
            req.session.destroy(err=>{
                if(err){
                    console.log('erro logout')
                    res.json({err: true})
                }
                else
                    res.json({err: false})
            })
        }
        else res.json({err: false})
    }
 
    InsertFavoriteBook(req, res){
        homeGet.insertFavoriteBook(req.body.UID, req.body.BID, (err, data)=>{
            if(err){
                homeGet.deleteFavoriteBook(req.body.UID, req.body.BID,(err, data)=>{
                    res.json({err: true})
                })
            }
            else
                res.json({err: false})

        })
    }
    getGenre(req, res){
        homeGet.genreModel((err, data)=>{
            if(err) res.json({err: true, data:null})
            else res.json({err:false, data:data.recordsets})
        })
    }
    getFilterGenre(req, res){
        homeGet.filterGenreModel(req.params.slug, (err,data)=>{
            if(err) res.json({err:true, data:null})
            else res.json({err: false, data})
        })
    }
}

module.exports = new HomeControllers;