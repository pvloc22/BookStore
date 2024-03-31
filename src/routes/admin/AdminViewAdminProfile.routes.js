const express = require('express');
const router = express.Router();
const adminViewAdminProfileControllers = require('../../app/controllers/admin/AdminViewAdminProfileControllers')

router.get('/:token', adminViewAdminProfileControllers.check_token, adminViewAdminProfileControllers.AdminViewAdminProfileGet)


module.exports = router