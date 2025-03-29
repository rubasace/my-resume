<script setup>
import {useDataStore} from "@/stores/dataStore";
import {InputChips, Select, Textarea, useToast} from "primevue";
import TextInput from "@/components/editor/TextInput.vue";
import InputItem from "@/components/editor/InputItem.vue";
import NumberInput from "@/components/editor/NumberInput.vue";
import {VueDraggable} from "vue-draggable-plus";
import Section from "@/components/editor/Section.vue";
import {computed, nextTick, ref, watch} from "vue";
import {useStyleStore} from "@/stores/styleStore";
import {getProfileNames} from "@/util/profileUtils";
import FilePicker from "@/components/editor/FilePicker.vue";

const toast = useToast();
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

const sourceType = ref(dataStore.pictureData ? 'file' : 'url')

const sourceOptions = [
  {label: 'URL', value: 'url'},
  {label: 'File', value: 'file'},
]

watch(() => dataStore.pictureData, (e) => {
  sourceType.value = e ? 'file' : 'url'
}, {immediate: true})

const removeElement = (array, index) => {
  array.splice(index, 1);
};

function uploadPicture(event) {
  const file = event.files?.[0];
  if (!file) return;

  const reader = new FileReader();

  reader.onload = () => {
    const base64Image = reader.result;
    try {
      dataStore.setPicture(file.name, base64Image);
      toast.add({
        severity: 'success',
        summary: 'Picture uploaded',
        detail: `${file.name} was uploaded successfully`,
        life: 5000
      });
    } catch (e) {
      toast.add({
        severity: 'error',
        summary: 'Error setting picture',
        detail: e.message,
        life: 5000
      });
    }
  };

  reader.onerror = () => {
    toast.add({
      severity: 'error',
      summary: 'Error reading file',
      detail: reader.error?.message || 'Unknown error',
      life: 5000
    });
  };

  reader.readAsDataURL(file); // converts to base64
}

</script>

<template>
  <!--  TODO add filepicker for picture-->
  <!--  TODO improve dragging of visor (looks like offset is always same???) -->
  <!--  TODO fix mobile UI -->
  <!--  TODO allow to change resume language -->
  <!--  TODO add translations-->
  <!--  TODO think of adding other themes-->
  <!--  TODO Generalize theme options (show icons,  shot timeline...) -->
  <!--  TODO Add alert on overflow and/or allow multi-page-->

  <!--  TODO cleanup unnecessary dependencies and fix vulnerabilities -->
  <!--  TODO onboard renovate -->
  <!--  TODO rethink if it makes sense to capitalize via CSS -->
  <!--  TODO design an onboarding flow for first time user??  -->
  <!--  TODO revisit separators so they only display when needed-->
  <!--  TODO allow to customize icon for profiles?-->
  <!--  TODO add validations?-->

  <Section name="basics" icon="fas fa-address-card" :hideable="false">
    <div class="grid-2">
      <TextInput v-model="dataStore.data.basics.name" label="Name"/>
      <TextInput v-model="dataStore.data.basics.label" label="Label"/>
      <TextInput v-model="dataStore.data.basics.phone" label="Phone"/>
      <TextInput v-model="dataStore.data.basics.email" label="Email"/>
      <TextInput v-model="dataStore.data.basics.location.summary" label="Location"/>
      <TextInput v-model="dataStore.data.basics.url" label="Website"/>
    </div>
  </Section>

  <Section name="picture" icon="fas fa-image">
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
      <div v-else-if="sourceType === 'file'" class="flex align-items-center">
        <div v-if="dataStore.pictureData" class="flex gap-3 align-items-center">
          <span class="picture-name">{{ dataStore.data.basics.picture }}</span>
          <button @click="dataStore.clearPicture" title="Zoom in"><i class="fas fa-times"/></button>
        </div>
        <FilePicker label="Upload picture" accept="image/*" @select="uploadPicture" v-else/>
      </div>

      <NumberInput v-model="styleStore.style.pictureTranslateX" label="TranslateX" :step="1" :max-fraction-digits="0" suffix="px"/>
      <NumberInput v-model="styleStore.style.pictureTranslateY" label="TranslateY" :step="1" :max-fraction-digits="0" suffix="px"/>
      <NumberInput v-model="styleStore.style.pictureScale" label="Scale" :min="0.1" :step="0.1"/>
    </div>
  </Section>
  <Section name="about" icon="fas fa-user" v-model="dataStore.data.basics.profiles">
    <Textarea auto-resize id="summary" v-model="dataStore.data.basics.summary" placeholder="Information about yourself (optional)" style="width:100%" class="mb-2 mt-2"/>
  </Section>
  <Section name="contact" icon="fas fa-link" v-model="dataStore.data.basics.profiles" :hideable="false">
    <VueDraggable v-model="dataStore.data.basics.profiles" handle=".handle">
      <InputItem v-for="(profile, index) in dataStore.data.basics.profiles"
                 :key="index"
                 v-model="dataStore.data.basics.profiles[index]"
                 @delete="removeElement(dataStore.data.basics.profiles, index)">
        <div class="grid-3">
          <!--   TODO Integrate with predefined set of networks-->
          <TextInput v-model="profile.network" label="Network" :options="getProfileNames()"/>
          <TextInput v-model="profile.url" label="URL"/>
          <TextInput v-model="profile.text" label="Text"/>
        </div>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addProfile" class="button-add">
      <i class="fas fa-plus"></i> Add Contact
    </button>
  </Section>
  <Section name="work" icon="fas fa-briefcase">
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
          <TextInput v-model="work.url" label="URL"/>
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

  <Section name="projects" icon="fas fa-diagram-project">
    <VueDraggable v-model="dataStore.data.projects" handle=".handle">
      <InputItem v-for="(project, index) in dataStore.data.projects"
                 :key="index"
                 v-model="dataStore.data.projects[index]"
                 @delete="removeElement(dataStore.data.projects,index)">
        <div class="grid-2">
          <TextInput v-model="project.name" label="Name"/>
          <TextInput v-model="project.url" label="URL"/>
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

  <Section name="publications" icon="fas fa-book">
    <VueDraggable v-model="dataStore.data.publications" handle=".handle">
      <InputItem v-for="(publication, index) in dataStore.data.publications"
                 :key="index"
                 v-model="dataStore.data.publications[index]"
                 @delete="removeElement(dataStore.data.publications, index)">
        <div class="grid-2">
          <TextInput v-model="publication.name" label="Name"/>
          <TextInput v-model="publication.url" label="URL"/>
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

  <Section name="conferences" icon="fas fa-microphone">
    <VueDraggable v-model="dataStore.data.conferences" handle=".handle">
      <InputItem v-for="(conference, index) in dataStore.data.conferences"
                 :key="index"
                 v-model="dataStore.data.conferences[index]"
                 @delete="removeElement(dataStore.data.conferences, index)">
        <div class="grid-2">
          <TextInput v-model="conference.title" label="Title"/>
          <TextInput v-model="conference.conference" label="Conference"/>
          <TextInput v-model="conference.location" label="Location"/>
          <TextInput v-model="conference.time" label="Time"/>
          <TextInput v-model="conference.url" label="URL"/>
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

  <Section name="education" icon="fas fa-graduation-cap">
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
          <TextInput v-model="education.url" label="Institution URL"/>
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

  <Section name="certificates" icon="fas fa-award">
    <VueDraggable v-model="dataStore.data.certificates" handle=".handle">
      <InputItem v-for="(certificate, index) in dataStore.data.certificates"
                 :key="index"
                 v-model="dataStore.data.certificates[index]"
                 @delete="removeElement(dataStore.data.certificates,index)">
        <div class="grid-2">
          <TextInput v-model="certificate.name" label="Name"/>
          <TextInput v-model="certificate.issuer" label="Issuer"/>
          <TextInput v-model="certificate.date" label="Date"/>
          <TextInput v-model="certificate.url" label="Certificate URL"/>
        </div>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addCertificate" class="button-add">
      <i class="fas fa-plus"></i> Add Certificate
    </button>
  </Section>

  <Section name="awards" icon="fas fa-trophy">
    <VueDraggable v-model="dataStore.data.awards" handle=".handle">
      <InputItem v-for="(award, index) in dataStore.data.awards"
                 :key="index" z
                 v-model="dataStore.data.awards[index]"
                 @delete="removeElement(dataStore.data.awards,index)">
        <div class="grid-2">
          <TextInput v-model="award.title" label="Title"/>
          <TextInput v-model="award.awarder" label="Awarder"/>
          <TextInput v-model="award.date" label="Date"/>
          <TextInput v-model="award.url" label="URL"/>
        </div>
        <!--        <label :for="'award-summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>-->
        <!--        <Textarea auto-resize :id="'award-summary-' + index" v-model="award.summary" placeholder="Description of award (optional)" style="width:100%"/>-->
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addAward" class="button-add">
      <i class="fas fa-plus"></i> Add Award
    </button>
  </Section>

  <Section name="skills" icon="fas fa-brain">
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

  <Section name="languages" icon="fas fa-language">
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

  <Section name="interests" icon="fas fa-star">
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
