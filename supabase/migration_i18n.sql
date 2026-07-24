alter table
  profile
add
  column if not exists role_en text;

alter table
  profile
add
  column if not exists role_es text;

alter table
  profile
add
  column if not exists summary_en text;

alter table
  profile
add
  column if not exists summary_es text;

alter table
  competencies
add
  column if not exists name_en text;

alter table
  competencies
add
  column if not exists name_es text;

alter table
  experience
add
  column if not exists role_en text;

alter table
  experience
add
  column if not exists role_es text;

alter table
  experience
add
  column if not exists bullets_en text [];

alter table
  experience
add
  column if not exists bullets_es text [];

alter table
  education
add
  column if not exists title_en text;

alter table
  education
add
  column if not exists title_es text;

alter table
  education
add
  column if not exists detail_en text;

alter table
  education
add
  column if not exists detail_es text;

alter table
  languages
add
  column if not exists name_en text;

alter table
  languages
add
  column if not exists name_es text;

alter table
  languages
add
  column if not exists level_en text;

alter table
  languages
add
  column if not exists level_es text;

update
  profile
set
  role_en = 'Full Stack Developer / UI-UX Designer',
  role_es = 'Desarrollador Full Stack / Diseñador UI-UX',
  summary_en = 'Professional with a degree in Systems Analysis and Development and 3 years of experience in the field. Dynamic and proactive profile, open to teamwork and continuous learning.',
  summary_es = 'Profesional con formación en Análisis y Desarrollo de Sistemas y 3 años de experiencia en el área. Perfil dinámico y proactivo, con disposición para el trabajo en equipo y el aprendizaje constante.';

update
  competencies
set
  name_en = 'Full Stack Development',
  name_es = 'Desarrollo Full Stack'
where
  name = 'Desenvolvimento Full Stack';

update
  competencies
set
  name_en = 'Front-end Development',
  name_es = 'Desarrollo Front-end'
where
  name = 'Desenvolvimento Front-end';

update
  competencies
set
  name_en = 'REST API Integration',
  name_es = 'Integración de APIs REST'
where
  name = 'Integração de APIs REST';

update
  competencies
set
  name_en = 'SQL Databases',
  name_es = 'Bases de Datos SQL'
where
  name = 'Banco de Dados SQL';

update
  competencies
set
  name_en = 'UI/UX',
  name_es = 'UI/UX'
where
  name = 'UI/UX';

update
  competencies
set
  name_en = 'Mobile Development',
  name_es = 'Desarrollo Móvil'
where
  name = 'Desenvolvimento Mobile';

update
  competencies
set
  name_en = 'Version Control with Git',
  name_es = 'Control de Versiones con Git'
where
  name = 'Versionamento com Git';

update
  competencies
set
  name_en = 'Docker',
  name_es = 'Docker'
where
  name = 'Docker';

update
  experience
set
  role_en = 'Full Stack Developer (Scholarship)',
  role_es = 'Desarrollador Full Stack (Becario)',
  bullets_en = array [
    'Development and maintenance of web applications using Vue.js, TypeScript, PHP, and SQL.',
    'Implementation of features and integration with REST APIs.',
    'Creation of responsive interfaces with a focus on usability.',
    'Collaboration in multidisciplinary teams using Git and Docker.'
  ],
  bullets_es = array [
    'Desarrollo y mantenimiento de aplicaciones web utilizando Vue.js, TypeScript, PHP y SQL.',
    'Implementación de funcionalidades e integración con APIs REST.',
    'Creación de interfaces responsivas con enfoque en usabilidad.',
    'Colaboración en equipos multidisciplinarios utilizando Git y Docker.'
  ]
where
  role = 'Desenvolvedor Full Stack (Bolsista)';

update
  experience
set
  role_en = 'Full Stack Intern',
  role_es = 'Pasante Full Stack',
  bullets_en = array ['Full Stack programming internship across projects in various areas.'],
  bullets_es = array ['Pasantía en programación Full Stack en proyectos de diversas áreas.']
where
  role = 'Estagiário Full Stack';

update
  experience
set
  role_en = 'Apprentice — Industrial Electrician',
  role_es = 'Aprendiz — Electricista Industrial',
  bullets_en = array ['Young apprentice through SENAI RS as an industrial electrician.'],
  bullets_es = array ['Joven aprendiz por SENAI RS como electricista industrial.']
where
  role = 'Cotista Aprendiz — Eletricista Industrial';

update
  experience
set
  role_en = 'SENAI Apprentice — Logistics Processes',
  role_es = 'Aprendiz SENAI — Procesos Logísticos',
  bullets_en = array ['Young apprentice through SENAI RS as a logistics process operator.'],
  bullets_es = array ['Joven aprendiz por SENAI RS como operador de procesos logísticos.']
where
  role = 'Aprendiz SENAI — Processos Logísticos';

update
  education
set
  title_en = 'Game Development and Digital Interfaces',
  title_es = 'Desarrollo de Juegos e Interfaces Digitales',
  detail_en = 'Studies in UI/UX, interaction design, and development of interactive applications.',
  detail_es = 'Estudios en UI/UX, diseño de interacción y desarrollo de aplicaciones interactivas.'
where
  title = 'Desenvolvimento de Jogos e Interfaces Digitais';

update
  education
set
  title_en = 'Associate Degree in Systems Analysis and Development',
  title_es = 'Tecnólogo en Análisis y Desarrollo de Sistemas',
  detail_en = 'Training in software development, databases, APIs, and software engineering.',
  detail_es = 'Formación en desarrollo de software, bases de datos, APIs e ingeniería de software.'
where
  title = 'Tecnólogo em Análise e Desenvolvimento de Sistemas';

update
  education
set
  title_en = 'Integrated Technical Degree in IT',
  title_es = 'Técnico Integrado en Informática',
  detail_en = 'Foundation in programming, databases, networking, and systems development.',
  detail_es = 'Base en programación, bases de datos, redes y desarrollo de sistemas.'
where
  title = 'Técnico Integrado em Informática';

update
  languages
set
  name_en = 'Portuguese',
  name_es = 'Portugués',
  level_en = 'Native',
  level_es = 'Nativo'
where
  name = 'Português';

update
  languages
set
  name_en = 'Spanish',
  name_es = 'Español',
  level_en = 'Fluent',
  level_es = 'Fluido'
where
  name = 'Espanhol';

update
  languages
set
  name_en = 'English',
  name_es = 'Inglés',
  level_en = 'Basic',
  level_es = 'Básico'
where
  name = 'Inglês';

update
  languages
set
  name_en = 'Italian',
  name_es = 'Italiano',
  level_en = 'Basic',
  level_es = 'Básico'
where
  name = 'Italiano';