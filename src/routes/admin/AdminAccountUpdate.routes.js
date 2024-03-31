const express = require('express');
const router = express.Router();
const adminAccountUpdateControllers = require('../../app/controllers/admin/AdminAccountUpdateControllers')

router.get('/:token', adminAccountUpdateControllers.check_token, adminAccountUpdateControllers.AdminAccountUpdateGet)

module.exports = router