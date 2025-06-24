const express = require('express');
const router = express.Router();
const professorController = require('../controllers/professor.controller');

router.get('/', professorController.findAll);
router.get('/:id', professorController.findOne);
router.post('/', professorController.create);
router.put('/:id', professorController.update);
router.delete('/:id', professorController.delete);

module.exports = router;