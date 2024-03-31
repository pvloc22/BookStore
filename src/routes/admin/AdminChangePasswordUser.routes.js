const express = require('express');
const router = express.Router();
const adminChangePasswordUserControllers = require('../../app/controllers/admin/AdminChangePasswordUserControllers')

router.get('/',adminChangePasswordUserControllers.AdminChangePasswordUserGet)


module.exports = router