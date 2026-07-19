export const profile = {
  name: 'Arthur dos S. Barbosa',
  role: 'Full Stack Developer / UI-UX Designer',
  location: 'Canoas, RS — Brasil',
  email: 'arthsbarbosa@gmail.com',
  linkedin: 'https://linkedin.com/in/', // adicione seu link completo
  github: 'https://github.com/', // adicione seu usuário
  summary:
    'Profissional com formação em Análise e Desenvolvimento de Sistemas e 3 anos de experiência na área. Perfil dinâmico e proativo, com disposição para o trabalho em equipe e o aprendizado constante.',
}

// Objetos com "name" para ficar no mesmo formato das linhas que vêm do
// Supabase (tabelas skills/competencies têm uma coluna "name").
export const skills = [
  { name: 'Java' }, { name: 'JavaScript' }, { name: 'TypeScript' }, { name: 'Vue.js' },
  { name: 'PHP / Laravel' }, { name: 'Flutter' }, { name: 'HTML5 & CSS3' }, { name: 'SQL' },
  { name: 'Docker' }, { name: 'Git' }, { name: 'Figma' }, { name: 'C++' },
]

export const competencies = [
  { name: 'Desenvolvimento Full Stack' },
  { name: 'Desenvolvimento Front-end' },
  { name: 'Integração de APIs REST' },
  { name: 'Banco de Dados SQL' },
  { name: 'UI/UX' },
  { name: 'Desenvolvimento Mobile' },
  { name: 'Versionamento com Git' },
  { name: 'Docker' },
]

export const experience = [
  {
    role: 'Desenvolvedor Full Stack (Bolsista)',
    company: 'ISI SIM, São Leopoldo',
    period: 'Mai/2025 — Atual',
    bullets: [
      'Desenvolvimento e manutenção de aplicações web utilizando Vue.js, TypeScript, PHP e SQL.',
      'Implementação de funcionalidades e integração com APIs REST.',
      'Criação de interfaces responsivas com foco em usabilidade.',
      'Colaboração em equipes multidisciplinares utilizando Git e Docker.',
    ],
  },
  {
    role: 'Estagiário Full Stack',
    company: 'ISI SIM, São Leopoldo',
    period: 'Out/2023 — Abr/2025',
    bullets: ['Estágio em programação Full Stack dentro de projetos de diversas áreas.'],
  },
  {
    role: 'Cotista Aprendiz — Eletricista Industrial',
    company: 'Weco SA, Porto Alegre (via SENAI RS)',
    period: 'Fev/2020 — Jun/2021',
    bullets: ['Jovem aprendiz pela SENAI RS como eletricista industrial.'],
  },
  {
    role: 'Aprendiz SENAI — Processos Logísticos',
    company: 'Luiz Fuga Ind. de Couro LTDA, São Leopoldo',
    period: 'Mar/2019 — Dez/2019',
    bullets: ['Jovem aprendiz pela SENAI RS como operador de processos logísticos.'],
  },
]

export const education = [
  {
    title: 'Desenvolvimento de Jogos e Interfaces Digitais',
    institution: 'Anhanguera — Pós-graduação',
    period: 'Abril de 2026 — Atual',
    detail: 'Estudos em UI/UX, design de interação e desenvolvimento de aplicações interativas.',
  },
  {
    title: 'Tecnólogo em Análise e Desenvolvimento de Sistemas',
    institution: 'ULBRA',
    period: 'Maio de 2023 — Dezembro de 2025',
    detail: 'Formação em desenvolvimento de software, bancos de dados, APIs e engenharia de software.',
  },
  {
    title: 'Técnico Integrado em Informática',
    institution: 'IFSul',
    period: 'Fevereiro de 2019 — Fevereiro de 2023',
    detail: 'Base em programação, banco de dados, redes e desenvolvimento de sistemas.',
  },
]

export const courses = [
  { name: 'Vue.js 3', provider: 'Vue.js Brasil' },
  { name: 'Desenvolvimento Android Completo', provider: 'Udemy' },
  { name: 'Desenvolvimento Android Iniciante', provider: 'Udemy' },
  { name: 'Maratona CISCO por CCIE Lucas Palma', provider: 'Cisco' },
]

export const languages = [
  { name: 'Português', level: 'Nativo', value: 100 },
  { name: 'Espanhol', level: 'Fluente', value: 90 },
  { name: 'Inglês', level: 'Básico', value: 35 },
  { name: 'Italiano', level: 'Básico', value: 30 },
]
