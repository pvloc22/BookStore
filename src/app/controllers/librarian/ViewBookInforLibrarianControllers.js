const dashBoardModel = require('../../../model/librarian/ViewBookInforLibrarian.models')

class ViewBookInforLibrarianControllers {
    ViewBookInforLibrarianDelete(req, res){
        dashBoardModel.ViewBookInforLibrarianDelete(req.body.bid, (err, data)=>{
            if(err)
            res.json({err: true})
            else 
            res.json({err: false})
        })
    }

    ViewBookInforLibrarianGet(req, res) {
        res.render('ViewBookInforLibrarian', { layout: 'Librarian_Layout.hbs' });

    }
}

module.exports = new ViewBookInforLibrarianControllers;