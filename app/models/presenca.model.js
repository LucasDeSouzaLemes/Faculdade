const db = require('../config/db.config');

class Presenca {
  static async findAll() {
    const [rows] = await db.query('SELECT * FROM presencas');
    return rows;
  }

  static async findById(id) {
    const [rows] = await db.query('SELECT * FROM presencas WHERE id = ?', [id]);
    return rows[0];
  }

  static async create(presenca) {
    const { aluno_id, professor_id, data_aula, presente, observacao } = presenca;
    const [result] = await db.query(
      'INSERT INTO presencas (aluno_id, professor_id, data_aula, presente, observacao) VALUES (?, ?, ?, ?, ?)',
      [aluno_id, professor_id, data_aula, presente, observacao]
    );
    return { id: result.insertId, ...presenca };
  }

  static async update(id, presenca) {
    const { aluno_id, professor_id, data_aula, presente, observacao } = presenca;
    await db.query(
      'UPDATE presencas SET aluno_id = ?, professor_id = ?, data_aula = ?, presente = ?, observacao = ? WHERE id = ?',
      [aluno_id, professor_id, data_aula, presente, observacao, id]
    );
    return { id, ...presenca };
  }

  static async delete(id) {
    await db.query('DELETE FROM presencas WHERE id = ?', [id]);
    return { id };
  }
}

module.exports = Presenca;