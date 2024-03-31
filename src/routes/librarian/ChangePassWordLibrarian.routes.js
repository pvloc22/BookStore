const express = require('express');
const router = express.Router();
const changePassWordLibrarian = require('../../app/controllers/librarian/ChangePassWordLibrarianControllers')

router.get('/:token', changePassWordLibrarian.check_token,changePassWordLibrarian.ChangePassWordLibrarianGet)


module.exports = router