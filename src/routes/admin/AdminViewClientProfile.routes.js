const express = require('express');
const router = express.Router();
const adminViewClientProfileControllers = require('../../app/controllers/admin/AdminViewClientProfileControllers')

router.get('/',adminViewClientProfileControllers.AdminViewClientProfileGet)


module.exports = router