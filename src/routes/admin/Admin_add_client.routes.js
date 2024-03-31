const express = require('express');
const router = express.Router();
const Admin_add_clientController = require('../../app/controllers/admin/Admin_add_clientControllers')

router.use('/:token', Admin_add_clientController.check_token,Admin_add_clientController.Admin_add_clientGet)


module.exports = router
// 