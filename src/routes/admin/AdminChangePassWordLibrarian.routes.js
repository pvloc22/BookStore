const express = require('express');
const router = express.Router();
const adminChangePassWordLibrarianControllers = require('../../app/controllers/admin/AdminChangePassWordLibrarianControllers')

router.get('/',adminChangePassWordLibrarianControllers.AdminChangePassWordLibrarianGet)


module.exports = router