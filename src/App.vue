<script setup>
import { useTable, useProfile } from './lib/useContent'
import TheHeader from './components/TheHeader.vue'
import HeroSection from './components/HeroSection.vue'
import AboutSection from './components/AboutSection.vue'
import SkillsSection from './components/SkillsSection.vue'
import ExperienceSection from './components/ExperienceSection.vue'
import EducationSection from './components/EducationSection.vue'
import ProjectsSection from './components/ProjectsSection.vue'
import ContactSection from './components/ContactSection.vue'
import TheFooter from './components/TheFooter.vue'

const GITHUB_USERNAME = 'arthur-s-barbosa'

const { data: profile } = useProfile()
const { data: skills } = useTable('skills', 'skills')
const { data: competencies } = useTable('competencies', 'competencies')
const { data: experience } = useTable('experience', 'experience')
const { data: education } = useTable('education', 'education')
const { data: courses } = useTable('courses', 'courses')
const { data: languages } = useTable('languages', 'languages')
</script>

<template>
  <TheHeader />
  <main>
    <HeroSection :profile="profile" />
    <AboutSection :profile="profile" :languages="languages" />
    <SkillsSection :skills="skills" :competencies="competencies" />
    <ExperienceSection :experience="experience" />
    <EducationSection :education="education" :courses="courses" />
    <ProjectsSection :github-username="GITHUB_USERNAME" />
    <ContactSection :profile="profile" />
  </main>
  <TheFooter />
</template>
