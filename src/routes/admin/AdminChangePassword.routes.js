const express = require('express');
const router = express.Router();
const adminChangePasswordControllers = require('../../app/controllers/admin/AdminChangePasswordControllers')

router.get('/:token', adminChangePasswordControllers.check_token,adminChangePasswordControllers.AdminChangePasswordGet)


module.exports = router