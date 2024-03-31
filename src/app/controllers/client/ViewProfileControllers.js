
const viewProfileModelModel = require('../../../model/client/ViewProfile.model')

class ViewProfileControllers {
    
    ViewProfileGet(req, res, next) {
        viewProfileModelModel.GetInfoClient(req.session.user.username,(err, data)=>{
            if(err) {res.json({err:true}); return}
            if(data[0].length > 0){
                try {
                    res.render('ViewProfile', { layout: 'Client_Layout.hbs', data: data[0][0], URL_AUTH:{pass: req.session.user.password} });  
                } catch (error) {
                    res.render('/erro')
                }
                return
            }
            res.json({err: true})
        })
    }
    ViewProfileCheck(req, res, next){
        try {
            if(req.session.user.password === req.params.token)
            {
                next()
            }
            else throw 'erro'
        } catch (error) {
            return res.redirect('/erro')
        }

    }
}

module.exports = new ViewProfileControllers;