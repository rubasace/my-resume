<script setup>
import WorkExperienceItem from "./WorkExperienceItem.vue";
import EducationItem from "./EducationItem.vue";

defineProps({
      currentTravixItems: {
        type: Array,
        default: [
          'Develop and maintain the corporate Java framework, built on top of Spring Boot.',
          'Create convenience tools for standardizing CI/CD steps following best practices: creating Docker images with JIB/Buildpacks, providing sensible, easily customizable defaults for JVM flags, allowing graceful shutdown of services, etc.',
          'Design a workflow to automatically react to zero-day vulnerabilities on the entire stack, combining Renovate bot and Snyk capabilities.',
          'Work as a part-time member of the Systems Engineering team, improving areas like logging and monitoring, k8s resources utilization, and the applications deployment process.',
          'Assist Java teams with technical challenges, architectural decisions, getting rid of technical debt, etc.'
        ]
      },
      previousTravixItems: {
        type: Array,
        default: [
          'Software engineer in Flights, Hotels and Service Packages teams, integrating different providers into our platform.'
        ]
      },
      imatiaItems: {
        type: Array,
        default: [
          'Design and develop java applications using Java 8, Reflection API, multithreading and classloaders.',
        ]
      },
      insaItems: {
        type: Array,
        default: [
          'Development and maintenance of eCommerce backend and parallel projects for the Inditex group, using Java and Spring Framework under the IBM WebSphere Commerce framework.'
        ]
      },
      teslaItems: {
        type: Array,
        default: [
          'Frontend development using HTML5, CSS3 and jQuery.',
        ]
      },
      uscDescription: {
        type: String,
        default: 'I developed and presented my own degree project, a poker bot able to make preflop decisions in a 6-max Sit&Go scenario.'
      }

    }
)
</script>
<template lang="pug">
.main
  .title
    p.name Rubén Pahíno
    p.role Software Engineer
  .section
    p.section-title Professional Experience
    .section-content.timeline
      WorkExperienceItem(company='Travix International', :items='currentTravixItems', location='Vigo, Spain', role='backend tech lead (remote)', time='Oct 2020 - Present')
      WorkExperienceItem(:items='previousTravixItems', location='London, United Kingdom', role='senior software engineer', time='Sep 2018 - Oct 2020')
      WorkExperienceItem(location='London, United Kingdom', role='intermediate software engineer', time='Nov 2017 - Sep 2018')
      WorkExperienceItem(location='London, United Kingdom', role='junior software engineer', time='Feb 2017 - Nov 2017')
      WorkExperienceItem(company='Imatia Innovation', :items='imatiaItems', location='Vigo, Spain', role='backend Developer', time='Aug 2015 - Feb 2017')
      WorkExperienceItem(company='INSA', :items='insaItems', location='Ourense, Spain', role='Junior backend developer', time='Mar 2016 - Aug 2015')
      WorkExperienceItem(company='Tesla Technologies', :items='teslaItems', location='Santiago de Compostela, Spain', role='Internship', time='Jun 2013 - Aug 2013')

  .section
    p.section-title Education
    .section-content.timeline
      EducationItem(time="2009-2014", name="Degree in Computer Engineering", school="Universidade de Santiago de Compostela", :description="uscDescription")

</template>

<style scoped lang="sass">
.main
  width: 100%
  height: 100%
  position: relative

  .title
    text-transform: uppercase
    font-size: 2em
    text-align: center
    margin-bottom: 2rem

    .role
      font-size: 0.618em

  .section
    width: 100%
    position: relative
    margin-top: 2rem

    .section-title
      font-size: 1.2em
      text-transform: uppercase

  .timeline
    position: relative
    &:deep(.place)
      position: relative
      left: -0.1cm
      padding-left: 0.1cm
      z-index: 1
      line-height: 2rem

    &:deep(.data)
      padding-left: 1rem
    &::after
      content: ""
      background: slategray
      position: absolute
      bottom: 0
      left: 0
      height: 98%
      width: 0.06cm
      border-right: 3em

</style>