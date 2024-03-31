const express = require('express');
const router = express.Router();
const adminViewClientControllers = require('../../app/controllers/admin/AdminViewClientControllers')

router.get('/:token', adminViewClientControllers.check_token, adminViewClientControllers.AdminViewClientGet)


module.exports = router