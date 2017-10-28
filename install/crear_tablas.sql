CREATE TABLE persona (
  id                 INTEGER PRIMARY KEY,
  activo             INTEGER,
  apellidos          TEXT,
  clave              TEXT,
  correo             TEXT,
  fechaAlta          TEXT,
  fechaModificacion  TEXT,
  idrol              INTEGER,
  nombre             TEXT,
  sexo               TEXT,
  ultimoInicioSesion TEXT,
  uvus               TEXT
);

CREATE TABLE rol (
  id          INTEGER PRIMARY KEY,
  descripcion TEXT,
  nombre      TEXT
);