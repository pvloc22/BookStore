const express = require('express');
const router = express.Router();
const adminViewProfileLibrarianControllers = require('../../app/controllers/admin/AdminViewProfileLibrarianControllers')

router.get('/:token', adminViewProfileLibrarianControllers.check_token, adminViewProfileLibrarianControllers.AdminViewProfileLibrarianGet)


module.exports = router