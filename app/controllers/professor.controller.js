const Professor = require('../models/professor.model');

exports.findAll = async (req, res) => {
  try {
    const professores = await Professor.findAll();
    res.json(professores);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.findOne = async (req, res) => {
  try {
    const professor = await Professor.findById(req.params.id);
    if (!professor) {
      return res.status(404).json({ message: 'Professor não encontrado' });
    }
    res.json(professor);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.create = async (req, res) => {
  try {
    const professor = await Professor.create(req.body);
    res.status(201).json(professor);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.update = async (req, res) => {
  try {
    const professor = await Professor.update(req.params.id, req.body);
    res.json(professor);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.delete = async (req, res) => {
  try {
    await Professor.delete(req.params.id);
    res.json({ message: 'Professor deletado com sucesso' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};