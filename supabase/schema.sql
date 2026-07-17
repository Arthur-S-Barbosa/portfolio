-- Rode este script no SQL Editor do Supabase (Project > SQL Editor > New query).
-- Cria uma tabela para cada seção do portfólio e já preenche com os dados do
-- seu currículo. Depois disso, você edita tudo direto pela aba "Table Editor"
-- do Supabase (adicionar/remover linhas), sem precisar tocar em código.

create table if not exists profile (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  role text,
  location text,
  email text,
  linkedin text,
  github text,
  summary text,
  photo_url text
);

create table if not exists skills (
  id serial primary key,
  name text not null,
  order_index int default 0
);

create table if not exists competencies (
  id serial primary key,
  name text not null,
  order_index int default 0
);

create table if not exists experience (
  id serial primary key,
  role text not null,
  company text,
  period text,
  bullets text[],
  order_index int default 0
);

create table if not exists education (
  id serial primary key,
  title text not null,
  institution text,
  period text,
  detail text,
  order_index int default 0
);

create table if not exists courses (
  id serial primary key,
  name text not null,
  provider text,
  order_index int default 0
);

create table if not exists languages (
  id serial primary key,
  name text not null,
  level text,
  value int,
  order_index int default 0
);

-- Row Level Security: o site é público e só faz LEITURA (select) direto do
-- navegador. Edições você faz logado no painel do Supabase, então bloqueamos
-- insert/update/delete para o público (anon key).
alter table profile enable row level security;
alter table skills enable row level security;
alter table competencies enable row level security;
alter table experience enable row level security;
alter table education enable row level security;
alter table courses enable row level security;
alter table languages enable row level security;

create policy "public read profile" on profile for select using (true);
create policy "public read skills" on skills for select using (true);
create policy "public read competencies" on competencies for select using (true);
create policy "public read experience" on experience for select using (true);
create policy "public read education" on education for select using (true);
create policy "public read courses" on courses for select using (true);
create policy "public read languages" on languages for select using (true);

-- Seed com os dados do currículo
insert into profile (name, role, location, email, linkedin, github, summary) values (
  'Arthur dos S. Barbosa',
  'Full Stack Developer / UI-UX Designer',
  'Canoas, RS — Brasil',
  'arthsbarbosa@gmail.com',
  'https://linkedin.com/in/SEU-USUARIO',
  'https://github.com/SEU-USUARIO',
  'Profissional com formação em Análise e Desenvolvimento de Sistemas e 3 anos de experiência na área. Perfil dinâmico e proativo, com disposição para o trabalho em equipe e o aprendizado constante.'
);

insert into skills (name, order_index) values
  ('Java', 1), ('JavaScript', 2), ('TypeScript', 3), ('Vue.js', 4),
  ('PHP / Laravel', 5), ('Flutter', 6), ('HTML5 & CSS3', 7), ('SQL', 8),
  ('Docker', 9), ('Git', 10), ('Figma', 11), ('C++', 12);

insert into competencies (name, order_index) values
  ('Desenvolvimento Full Stack', 1), ('Desenvolvimento Front-end', 2),
  ('Integração de APIs REST', 3), ('Banco de Dados SQL', 4),
  ('UI/UX', 5), ('Desenvolvimento Mobile', 6),
  ('Versionamento com Git', 7), ('Docker', 8);

insert into experience (role, company, period, bullets, order_index) values
  ('Desenvolvedor Full Stack (Bolsista)', 'ISI SIM, São Leopoldo', 'Mai/2025 — Atual',
    array[
      'Desenvolvimento e manutenção de aplicações web utilizando Vue.js, TypeScript, PHP e SQL.',
      'Implementação de funcionalidades e integração com APIs REST.',
      'Criação de interfaces responsivas com foco em usabilidade.',
      'Colaboração em equipes multidisciplinares utilizando Git e Docker.'
    ], 1),
  ('Estagiário Full Stack', 'ISI SIM, São Leopoldo', 'Out/2023 — Abr/2025',
    array['Estágio em programação Full Stack dentro de projetos de diversas áreas.'], 2),
  ('Cotista Aprendiz — Eletricista Industrial', 'Weco SA, Porto Alegre (via SENAI RS)', 'Fev/2020 — Jun/2021',
    array['Jovem aprendiz pela SENAI RS como eletricista industrial.'], 3),
  ('Aprendiz SENAI — Processos Logísticos', 'Luiz Fuga Ind. de Couro LTDA, São Leopoldo', 'Mar/2019 — Dez/2019',
    array['Jovem aprendiz pela SENAI RS como operador de processos logísticos.'], 4);

insert into education (title, institution, period, detail, order_index) values
  ('Desenvolvimento de Jogos e Interfaces Digitais', 'Anhanguera — Pós-graduação', 'Abril de 2026 — Atual',
    'Estudos em UI/UX, design de interação e desenvolvimento de aplicações interativas.', 1),
  ('Tecnólogo em Análise e Desenvolvimento de Sistemas', 'ULBRA', 'Maio de 2023 — Dezembro de 2025',
    'Formação em desenvolvimento de software, bancos de dados, APIs e engenharia de software.', 2),
  ('Técnico Integrado em Informática', 'IFSul', 'Fevereiro de 2019 — Fevereiro de 2023',
    'Base em programação, banco de dados, redes e desenvolvimento de sistemas.', 3);

insert into courses (name, provider, order_index) values
  ('Vue.js 3', 'Vue.js Brasil', 1),
  ('Desenvolvimento Android Completo', 'Udemy', 2),
  ('Desenvolvimento Android Iniciante', 'Udemy', 3),
  ('Maratona CISCO por CCIE Lucas Palma', 'Cisco', 4);

insert into languages (name, level, value, order_index) values
  ('Português', 'Nativo', 100, 1),
  ('Espanhol', 'Fluente', 90, 2),
  ('Inglês', 'Básico', 35, 3),
  ('Italiano', 'Básico', 30, 4);
