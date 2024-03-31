const MyInterestingBookModel = require('../../../model/client/myInterestingBook.model')

class MyInterestingBook {
    MyInterestingBookGet(req, res) {
        const url_auth = {pass: req.session.user.password}

        MyInterestingBookModel.readFavorites((err, data)=>{
            if(err) res.redirect('/erro')
            else{
                res.render('MyInterestingBook', { layout: 'Client_Layout.hbs', URL_AUTH: url_auth, data:data[0]});
            }
        })


    }
}

module.exports = new MyInterestingBook;