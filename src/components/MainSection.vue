<script setup>
import WorkExperienceItem from "./WorkExperienceItem.vue";
import EducationItem from "./EducationItem.vue";
import SkillItem from "./SkillItem.vue";

//Missing projects and talks, missing extra skills

defineProps({
      currentTravixItems: {
        type: Array,
        default: [
          'Worked at the London offices until October 2020 and remotely from Spain since then.',
          'Helped two small Java teams develop and maintain 200+ microservices by designing and building a corporate Java framework, extending Spring Boot capabilities.',
          'Removed all Java applications dependency vulnerabilities and reduced zero-days MTTR to hours (since the third-party fixes are provided) by designing a workflow to automatically keep dependencies up to date, combining Renovate bot and Snyk.',
          'Improved Java teams velocity and stack reliability by standardizing the CI/CD process, providing base Docker images to transparently adopt JIB/Buildpacks, providing sensible, easily customizable defaults for JVM flags and allowing graceful shutdown of services, among others.',
          'Reduced the infrastructure cost in a 5% (~7K€/month) by revisiting logging volume and Kubernetes cluster resource utilization, as a part-time member of the Systems Engineering team.',
          //Revisit last sentence
          'Eliminated most Java technical debt, performed over 50 knowledge sharing sessions, took architectural decisions and helped improve the overall company-wide stack as a Backend (Java) Tech lead.',
        ]
      },
      imatiaItems: {
        type: Array,
        default: [
          'Designed and developed Java applications using Java 8, Reflection API and classloaders.',
        ]
      },
      insaItems: {
        type: Array,
        default: [
          'Developed eCommerce backend and parallel projects for the Inditex group, using Java and Spring.'
        ]
      },
      teslaItems: {
        type: Array,
        default: [
          'Developed frontend applications using HTML5, CSS3 and jQuery.',
        ]
      },
      pcarrierDescription: {
        type: String,
        default: 'Remote master in Java 8, iOS and Android programming. Finished Java 8 with a 9.8 score over 10, didn\'t finish iOS and Android as I didn\'t enjoy mobile programming.'
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
    .contact
      SkillItem(title="Github", value="github.com/rubasace")
      SkillItem(title="Linkedin", value="linkedin.com/in/rubenpahino")
      SkillItem(title="Email", value="ruben.pahino.verdugo@gmail.com")
  .section
    p.section-title Professional Experience
    .section-content.timeline
      WorkExperienceItem(:items='currentTravixItems', company='Travix International', location='London, UK (Remote)', role='Backend tech lead', time='Feb 2017 - Present')
      WorkExperienceItem(company='Imatia Innovation', :items='imatiaItems', location='Vigo, Spain', role='Backend Developer', time='Aug 2015 - Feb 2017')
      WorkExperienceItem(company='INSA', :items='insaItems', location='Ourense, Spain', role='Junior backend developer', time='Mar 2015 - Aug 2015')
      WorkExperienceItem(company='Tesla Technologies', :items='teslaItems', location='Santiago de Compostela, Spain', role='Internship', time='Jun 2013 - Aug 2013')

  .section
    p.section-title Education
    .section-content.timeline
      EducationItem(time="2014-2015", name="Master in Java 8 programming", school="PCarrier")
      EducationItem(time="2009-2014", name="Degree in Computer Engineering", school="USC(Santiago de Compostela)")

  .section
    p.section-title Skills
    .section-content
      SkillItem(title="Programming", value="Java, Spring Boot, Project Reactor, Resilience4J, Hibernate, Maven, Git.")
      SkillItem(title="Infrastructure", value="Docker, Kubernetes, Helm, Drone I/O, CircleCI, Flux2.")
    .section

  .section
    p.section-title Languages
    .section-content
      SkillItem(title="Spanish", value="Native.")
      SkillItem(title="English", value="Fluent.")

</template>

<style scoped lang="sass">
$rightTraslation: 0
.main
  width: 100%
  height: 100%
  position: relative
  left: $rightTraslation

  .title
    position: relative
    text-transform: uppercase
    font-size: 2.5em
    margin-bottom: 2rem
    .name
      font-weight: bold
    .role
      font-size: 0.5em
      font-style: italic
    .contact
      position: absolute
      right: 0
      top: 0
      text-align: left
      text-transform: none
      font-size: 1rem

  .section
    width: 100%
    position: relative
    margin-top: 1rem

    .section-title
      font-size: 1.2em
      text-transform: uppercase
      margin-bottom: 0.5rem
      font-weight: bold

  .timeline
    position: relative
    margin-right: $rightTraslation
    //left: 0.375in
    &:deep(.item)
      //padding-left: 1rem
      .place
        position: relative
        line-height: 2.3rem
        &::before
          content: " "
          background-color: whitesmoke
          position: absolute
          display: inline-block
          width: 0.3cm
          height: 0.3cm
          border-radius: 1cm
          z-index: 1
          border: 0.065cm solid black
          top: 0.16rem
          left: -1.42rem
          $pointSpace: 0.35rem
          box-shadow: 0 $pointSpace 0px whitesmoke, 0 calc(#{$pointSpace} * -1) 0px whitesmoke
      .title
        .name
          position: relative

    &::after
      content: ""
      background-color: slategray
      position: absolute
      bottom: 0.29rem
      left: -1rem
      top: 0.5rem
      width: 0.06cm
      border-right: 3em

</style>