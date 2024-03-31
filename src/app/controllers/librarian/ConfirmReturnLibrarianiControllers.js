const ConfirmReturnLibrarianModel = require('../../../model/librarian/ConfirmReturnLibrarian.model')


class ConfirmReturnLibrarianControllers{

    UpdateStateTo_Confirm(req, res){
        ConfirmReturnLibrarianModel.UpdateConfirm(req.body.tid, (err, data)=>{
            if(err) res.json({err: true})
            else res.json({err: false})
        })
    }
}
module.exports = new ConfirmReturnLibrarianControllers