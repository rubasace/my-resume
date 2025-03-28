<script setup>
import {useDataStore} from "@/stores/dataStore";
import {InputChips, Textarea, Select} from "primevue";
import TextInput from "@/components/editor/TextInput.vue";
import InputItem from "@/components/editor/InputItem.vue";
import NumberInput from "@/components/editor/NumberInput.vue";
import {VueDraggable} from "vue-draggable-plus";
import Section from "@/components/editor/Section.vue";
import {computed, reactive, ref, watch} from "vue";
import {useStyleStore} from "@/stores/styleStore";


const dataStore = useDataStore();
const styleStore = useStyleStore();

const pageTitle = computed(() => {
  const name = dataStore.data.basics?.name || ''
  const label = dataStore.data.basics?.label || ''
  return `${name}${label ? ' – ' + label + ' Resume' : ''}`
})

// Watch for changes and update the page title
watch(pageTitle, (newTitle) => {
  document.title = newTitle
}, {immediate: true})

const sourceType = ref('url')
const sourceOptions = [
  {label: 'URL', value: 'url'},
  // { label: 'File', value: 'file' },
]

const removeElement = (array, index) => {
  array.splice(index, 1);
};

</script>

<template>
  <!--  TODO allow to modify order of sections at will-->
  <!--  TODO add filepicker for picture-->
  <!--  TODO integrate email, phone, and location into networks so they can be reordered> They should be special input items, reorderable but not removable?? maybe not worth it -->
  <!--  TODO allow to show margins-->
  <!--  TODO Revisit items with URL so we can add them as links keeping text visible-->
  <!--  TODO add translations-->
  <!--  TODO improve dragging of visor (looks like offset is always same???) -->
  <!--  TODO Add alert on overflow and/or allow multi-page-->
  <!--  TODO fix mobile UI -->
  <!--  TODO allow to add experience from the top-->
  <!--  TODO think of adding other themes-->
  <!--  TODO Generalize theme options (show icons,  shot timeline...) -->
  <!--  TODO add support for text on profiles and allow to indicate icon-->
  <!--  TODO Revisit sizes of the entire resume as margins don't look the same on all resolutions -->
  <!--  TODO add validations?-->

  <Section legend="Basic Data" icon="fas fa-address-card" :hideable="false">
    <div class="grid-2">
      <TextInput v-model="dataStore.data.basics.name" label="Name"/>
      <TextInput v-model="dataStore.data.basics.label" label="Label"/>
      <TextInput v-model="dataStore.data.basics.phone" label="Phone"/>
      <TextInput v-model="dataStore.data.basics.email" label="Email"/>
      <TextInput v-model="dataStore.data.basics.location.summary" label="Location"/>
    </div>
  </Section>

  <Section legend="Picture" icon="fas fa-image">
    <div class="grid-2">
      <Select
          v-model="sourceType"
          :options="sourceOptions"
          optionLabel="label"
          optionValue="value"
          class="w-full md:w-40"
          placeholder="Select source"
      />

      <TextInput
          v-if="sourceType === 'url'"
          v-model="dataStore.data.basics.picture"
          label="Picture URL"
          placeholder="https://example.com/image.jpg"
      />

      <div v-else-if="sourceType === 'file'" class="flex flex-col gap-1">
        <input type="file" @change="handleFileUpload" accept="image/*"/>
        <small class="text-sm text-gray-500">Max 4MB</small>
        <div v-if="uploadError" class="text-red-500 text-sm">{{ uploadError }}</div>
      </div>

      <!--      <div v-if="dataStore.data.basics.picture" class="mt-4">-->
      <!--        <label class="font-semibold">Preview</label>-->
      <!--        <img :src="dataStore.data.basics.picture" alt="Preview" class="max-w-xs rounded shadow"/>-->
      <!--      </div>-->

      <NumberInput v-model="styleStore.style.pictureTranslateX" label="TranslateX" :step="1" :max-fraction-digits="0" suffix="px"/>
      <NumberInput v-model="styleStore.style.pictureTranslateY" label="TranslateY" :step="1" :max-fraction-digits="0" suffix="px"/>
      <NumberInput v-model="styleStore.style.pictureScale" label="Scale" :min="0.1" :step="0.1"/>
    </div>
  </Section>
  <Section legend="About" icon="fas fa-user" v-model="dataStore.data.basics.profiles">
    <Textarea auto-resize id="summary" v-model="dataStore.data.basics.summary" placeholder="Information about yourself (optional)" style="width:100%" class="mb-2 mt-2"/>
  </Section>
  <Section legend="Contact" icon="fas fa-link" v-model="dataStore.data.basics.profiles">
    <VueDraggable v-model="dataStore.data.basics.profiles" handle=".handle">
      <InputItem v-for="(profile, index) in dataStore.data.basics.profiles"
                 :key="index"
                 v-model="dataStore.data.basics.profiles[index]"
                 @delete="removeElement(dataStore.data.basics.profiles, index)">
        <div class="grid-3">
          <!--   TODO Integrate with predefined set of networks-->
          <TextInput v-model="profile.network" label="Network" :options="['Linkedin', 'Twitter', 'GitHub']"/>
          <TextInput v-model="profile.url" label="URL"/>
          <TextInput v-model="profile.text" label="Text"/>
        </div>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addProfile" class="button-add">
      <i class="fas fa-plus"></i> Add Contact
    </button>
  </Section>
  <Section legend="Experience" icon="fas fa-briefcase">
    <VueDraggable v-model="dataStore.data.work" handle=".handle">
      <InputItem v-for="(work, index) in dataStore.data.work"
                 :key="index"
                 v-model="dataStore.data.work[index]"
                 @delete="removeElement(dataStore.data.work,index)">
        <div class="grid-3">
          <TextInput v-model="work.name" label="Company"/>
          <TextInput v-model="work.position" label="Position"/>
          <TextInput v-model="work.location" label="Location"/>
          <TextInput v-model="work.startDate" label="Start Date"/>
          <TextInput v-model="work.endDate" label="End Date"/>
        </div>
        <label :for="'summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>
        <Textarea auto-resize :id="'summary-' + index" v-model="work.summary" placeholder="Description of the job (optional)" style="width:100%"/>
        <label :for="'highlight-' + index + '-' + 0" class="font-bold block mb-3 mt-3">Highlights</label>
        <VueDraggable v-model="work.highlights" handle=".handle">
          <InputItem
              v-for="(highlight, highlightIndex) in work.highlights"
              :key="highlightIndex"
              skip-summary
              @delete="work.highlights.splice(highlightIndex, 1)"
          >
        <Textarea
            :id="'highlight-' + index + '-' + highlightIndex"
            v-model="work.highlights[highlightIndex]"
            style="width:100%"
            auto-resize
        />
          </InputItem>
        </VueDraggable>
        <button @click="dataStore.addHighlight(work)" class="button-add">
          <i class="fas fa-plus"></i> Add Highlight
        </button>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addExperience" class="button-add">
      <i class="fas fa-plus"></i> Add Experience
    </button>
  </Section>

  <Section legend="Projects" icon="fas fa-diagram-project">
    <VueDraggable v-model="dataStore.data.projects" handle=".handle">
      <InputItem v-for="(project, index) in dataStore.data.projects"
                 :key="index"
                 v-model="dataStore.data.projects[index]"
                 @delete="removeElement(dataStore.data.projects,index)">
        <div class="grid-3">
          <TextInput v-model="project.name" label="Name"/>
          <TextInput v-model="project.startDate" label="Start Date"/>
          <TextInput v-model="project.endDate" label="End Date"/>
        </div>
        <label :for="'project-summary-' + index" class="font-bold block mb-3 mt-3">Description</label>
        <Textarea auto-resize :id="'project-summary-' + index" v-model="project.description" placeholder="Description of the project (optional)" style="width:100%"/>
        <label :for="'project-highlight-' + index + '-' + 0" class="font-bold block mb-3 mt-3">Highlights</label>
        <VueDraggable v-model="project.highlights" handle=".handle">
          <InputItem
              v-for="(highlight, highlightIndex) in project.highlights"
              :key="highlightIndex"
              skip-summary
              @delete="project.highlights.splice(highlightIndex, 1)"
          >
        <Textarea
            :id="'project-highlight-' + index + '-' + highlightIndex"
            v-model="project.highlights[highlightIndex]"
            style="width:100%"
            auto-resize
        />
          </InputItem>
        </VueDraggable>
        <button @click="dataStore.addHighlight(project)" class="button-add">
          <i class="fas fa-plus"></i> Add Highlight
        </button>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addProject" class="button-add">
      <i class="fas fa-plus"></i> Add Project
    </button>
  </Section>

  <Section legend="Publications" icon="fas fa-book">
    <VueDraggable v-model="dataStore.data.publications" handle=".handle">
      <InputItem v-for="(publication, index) in dataStore.data.publications"
                 :key="index"
                 v-model="dataStore.data.publications[index]"
                 @delete="removeElement(dataStore.data.publications, index)">
        <div class="grid-2">
          <TextInput v-model="publication.name" label="Name"/>
          <TextInput v-model="publication.publisher" label="Publisher"/>
          <TextInput v-model="publication.releaseDate" label="Release Date"/>
        </div>
        <label :for="'publication-summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>
        <Textarea auto-resize :id="'publication-summary-' + index" v-model="publication.summary" placeholder="Description of the publication (optional)"
                  style="width:100%"/>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addPublication" class="button-add">
      <i class="fas fa-plus"></i> Add Publication
    </button>
  </Section>

  <Section legend="Conferences" icon="fas fa-microphone">
    <VueDraggable v-model="dataStore.data.conferences" handle=".handle">
      <InputItem v-for="(conference, index) in dataStore.data.conferences"
                 :key="index"
                 v-model="dataStore.data.conferences[index]"
                 @delete="removeElement(dataStore.data.conferences, index)">
        <div class="grid-2">
          <TextInput v-model="conference.conference" label="Conference"/>
          <TextInput v-model="conference.name" label="Name"/>
          <TextInput v-model="conference.location" label="Location"/>
          <TextInput v-model="conference.time" label="Time"/>
        </div>
        <label :for="'conference-summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>
        <Textarea auto-resize :id="'conference-summary-' + index" v-model="conference.summary" placeholder="Description of the job (optional)"
                  style="width:100%"/>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addConference" class="button-add">
      <i class="fas fa-plus"></i> Add Conference
    </button>
  </Section>

  <Section legend="Education" icon="fas fa-graduation-cap">
    <VueDraggable v-model="dataStore.data.education" handle=".handle">
      <InputItem v-for="(education, index) in dataStore.data.education"
                 :key="index"
                 v-model="dataStore.data.education[index]"
                 @delete="removeElement(dataStore.data.education,index)">
        <div class="grid-2">
          <TextInput v-model="education.institution" label="Institution"/>
          <TextInput v-model="education.studyType" label="Study Type"/>
          <TextInput v-model="education.startDate" label="Start Date"/>
          <TextInput v-model="education.endDate" label="End Date"/>
        </div>
        <!--      <label :for="'conference-summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>-->
        <!--      <Textarea auto-resize :id="'conference-summary-' + index" v-model="education.summary" placeholder="Description of the job (optional)"-->
        <!--                style="width:100%"/>-->
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addEducation" class="button-add">
      <i class="fas fa-plus"></i> Add Education
    </button>
  </Section>

  <Section legend="Certificates" icon="fas fa-award">
    <VueDraggable v-model="dataStore.data.certificates" handle=".handle">
      <InputItem v-for="(certificate, index) in dataStore.data.certificates"
                 :key="index"
                 v-model="dataStore.data.certificates[index]"
                 @delete="removeElement(dataStore.data.certificates,index)">
        <div class="grid-3">
          <TextInput v-model="certificate.name" label="Name"/>
          <TextInput v-model="certificate.issuer" label="Issuer"/>
          <TextInput v-model="certificate.date" label="Date"/>
        </div>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addCertificate" class="button-add">
      <i class="fas fa-plus"></i> Add Certificate
    </button>
  </Section>

  <Section legend="Awards" icon="fas fa-trophy">
    <VueDraggable v-model="dataStore.data.awards" handle=".handle">
      <InputItem v-for="(award, index) in dataStore.data.awards"
                 :key="index" z
                 v-model="dataStore.data.awards[index]"
                 @delete="removeElement(dataStore.data.awards,index)">
        <div class="grid-3">
          <TextInput v-model="award.title" label="Title"/>
          <TextInput v-model="award.awarder" label="Awarder"/>
          <TextInput v-model="award.date" label="Date"/>
        </div>
        <!--        <label :for="'award-summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>-->
        <!--        <Textarea auto-resize :id="'award-summary-' + index" v-model="award.summary" placeholder="Description of award (optional)" style="width:100%"/>-->
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addAward" class="button-add">
      <i class="fas fa-plus"></i> Add Award
    </button>
  </Section>

  <Section legend="Skills" icon="fas fa-brain">
    <VueDraggable v-model="dataStore.data.skills" handle=".handle">
      <InputItem v-for="(skill, index) in dataStore.data.skills"
                 :key="index"
                 v-model="dataStore.data.skills[index]"
                 @delete="removeElement(dataStore.data.skills,index)">
        <div class="grid-2">
          <TextInput v-model="skill.name" label="Name"/>
        </div>
        <label :for="'keywords-'+index" class="font-bold block mb-2 mt-2"> Keywords </label>
        <InputChips placeholder="Add a keyword" v-model="skill.keywords" :input-id="'keywords-'+index"/>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addSkill" class="button-add">
      <i class="fas fa-plus"></i> Add Skill
    </button>
  </Section>

  <Section legend="Languages" icon="fas fa-language">
    <VueDraggable v-model="dataStore.data.languages" handle=".handle">
      <InputItem v-for="(language, index) in dataStore.data.languages"
                 :key="index"
                 v-model="dataStore.data.languages[index]"
                 @delete="removeElement(dataStore.data.languages,index)">
        <div class="grid-2">
          <TextInput v-model="language.language" label="Language"/>
          <TextInput v-model="language.fluency" label="Fluency"/>
        </div>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addLanguage" class="button-add">
      <i class="fas fa-plus"></i> Add Language
    </button>
  </Section>

  <Section legend="Interests" icon="fas fa-star">
    <VueDraggable v-model="dataStore.data.interests" handle=".handle">
      <InputItem v-for="(interest, index) in dataStore.data.interests"
                 :key="index"
                 v-model="dataStore.data.interests[index]"
                 @delete="removeElement(dataStore.data.interests,index)">
        <div class="grid-2">
          <TextInput v-model="interest.name" label="Name"/>
        </div>
        <label :for="'keywords-'+index" class="font-bold block mb-2 mt-2"> Keywords </label>
        <InputChips placeholder="Add a keyword" v-model="interest.keywords" :input-id="'keywords-'+index"/>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addInterest" class="button-add">
      <i class="fas fa-plus"></i> Add Interest
    </button>
  </Section>

</template>

<style scoped lang="sass">
.section-title
  width: 100%
  margin: 1em 0
  font-weight: bold
  font-size: 1.6em

.button-add
  width: 100%
  padding: 1em
  //background: transparent
  border-radius: 10px
  border: 1px solid #555
  box-shadow: 4px 4px 4px #111
  background-color: rgba(#666, 0.1)

  &:hover
    cursor: pointer
    border-color: var(--p-primary-color)
    color: var(--p-primary-color)

  i
    margin-right: 0.5em

::v-deep(.p-icon):hover
  border-color: var(--p-primary-color)
  color: var(--p-primary-color)

</style>
