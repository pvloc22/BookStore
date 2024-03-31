const { Router } = require('express');
const express = require('express');
const router = express.Router();
const dashboardLibrarianControllers = require('../../app/controllers/librarian/DashboardLibrarianControllers')

router.get('/ConfirmReturnLibrarian/:slug/:token', dashboardLibrarianControllers.check_token,dashboardLibrarianControllers.DashboardLibrarianGetSlug)
router.get('/:token', dashboardLibrarianControllers.check_token,dashboardLibrarianControllers.DashboardLibrarianGet)
module.exports = router