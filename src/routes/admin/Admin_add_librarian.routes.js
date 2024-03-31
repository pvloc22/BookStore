const express = require('express');
const router = express.Router();
const Admin_add_librarianController = require('../../app/controllers/admin/Admin_add_librarianControllers')

router.get('/:token', Admin_add_librarianController.check_token,Admin_add_librarianController.Admin_add_librarianGet)


module.exports = router
// 