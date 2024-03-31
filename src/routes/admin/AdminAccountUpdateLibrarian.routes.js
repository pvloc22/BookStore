const express = require('express');
const router = express.Router();
const adminAccountUpdateLibrarianControllers = require('../../app/controllers/admin/AdminAccountUpdateLibrarianControllers')

router.get('/',adminAccountUpdateLibrarianControllers.AdminAccountUpdateLibrarianGet)


module.exports = router