const express = require('express');
const router = express.Router();
const statistic_AdminControllers = require('../../app/controllers/admin/Statistic_AdminControllers')

router.get('/transactions', statistic_AdminControllers.Statistic_AdminGetTransaction)
router.get('/:token',statistic_AdminControllers.check_token,statistic_AdminControllers.Statistic_AdminGet)


module.exports = router