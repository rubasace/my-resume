<script setup>
import {useDataStore} from "@/stores/dataStore";
import {InputChips, Select, Textarea, useToast} from "primevue";
import TextInput from "@/components/editor/TextInput.vue";
import InputItem from "@/components/editor/InputItem.vue";
import NumberInput from "@/components/editor/NumberInput.vue";
import {VueDraggable} from "vue-draggable-plus";
import Section from "@/components/editor/Section.vue";
import {computed, ref, watch} from "vue";
import {useStyleStore} from "@/stores/styleStore";
import {getProfileNames} from "@/util/profileUtils";
import FilePicker from "@/components/editor/FilePicker.vue";
import {useLocaleStore} from "@/stores/localeStore";

const toast = useToast();
const dataStore = useDataStore();
const styleStore = useStyleStore();
const localeStore = useLocaleStore();

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

const sourceOptions = computed(() => [
  {label: localeStore.getAppMessage('editor.data.picture.urlType').value, value: 'url'},
  {label: localeStore.getAppMessage('editor.data.picture.fileType').value, value: 'file'},
])

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
        summary: localeStore.getAppMessage('editor.data.picture.success'),
        detail: localeStore.getAppMessage('editor.data.picture.successDetail', { name: file.name }),
        life: 5000
      });
    } catch (e) {
      toast.add({
        severity: 'error',
        summary: localeStore.getAppMessage('editor.data.picture.error'),
        detail: e.message,
        life: 5000
      });
    }
  };

  reader.onerror = () => {
    toast.add({
      severity: 'error',
      summary: localeStore.getAppMessage('editor.data.picture.error'),
      detail: reader.error?.message || 'Unknown error',
      life: 5000
    });
  };

  reader.readAsDataURL(file); // converts to base64
}

const localeOptions = computed(() =>
    localeStore.supportedLocales.map((code) => ({
      label: `${localeStore.getFlag(code)} ${code.toUpperCase()}`,
      value: code,
      flag: localeStore.getFlag(code)
    }))
)

function localeOptionTemplate(option) {
  return `${option.flag} ${option.value.toUpperCase()}`
}

</script>

<template>
  <!--  TODO add translations for menus and support language switching -->
  <!--  TODO Add alert on overflow and/or allow multi-page-->
  <!--  TODO Generalize theme options (show icons, show timeline...) make them configurable per theme -->

  <!--  TODO design color palette -->
  <!--  TODO Think of integration with openai API for automatic translation if key proivded by user? -->
  <!--  TODO improve printing to PDF on Android -->
  <!--  TODO add image preview for mobile display -->
  <!--  TODO cleanup unnecessary dependencies and fix vulnerabilities -->
  <!--  TODO design an onboarding flow for first time user??  -->
  <!--  TODO improve zoom gestures so zoom origin initiates from the place its pinched -->
  <!--  TODO allow to customize icon for profiles?-->
  <!--  TODO add validations?-->

  <Section name="locale" icon="fas fa-globe" :hideable="false">
  <div class="grid-2">
    <Select
        id="resume-language"
        v-model="dataStore.data.language"
        :options="localeOptions"
        option-label="label"
        option-value="value"
        class="w-full"
        :item-template="localeOptionTemplate"
        placeholder="Select Language"
    />
  </div>
  </Section>
  <Section name="basics" icon="fas fa-address-card" :hideable="false">
    <div class="grid-2">
      <TextInput v-model="dataStore.data.basics.name" :label="localeStore.getAppMessage('editor.data.basics.name')"/>
      <TextInput v-model="dataStore.data.basics.label" :label="localeStore.getAppMessage('editor.data.basics.label')"/>
      <TextInput v-model="dataStore.data.basics.phone" :label="localeStore.getAppMessage('editor.data.basics.phone')"/>
      <TextInput v-model="dataStore.data.basics.email" :label="localeStore.getAppMessage('editor.data.basics.email')"/>
      <TextInput v-model="dataStore.data.basics.location.summary" :label="localeStore.getAppMessage('editor.data.basics.location')"/>
      <TextInput v-model="dataStore.data.basics.url" :label="localeStore.getAppMessage('editor.data.basics.website')"/>
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
          :label="localeStore.getAppMessage('editor.data.picture.url')"
          :placeholder="localeStore.getAppMessage('editor.data.picture.placeholder')"
      />
      <div v-else-if="sourceType === 'file'" class="flex align-items-center">
        <div v-if="dataStore.pictureData" class="flex gap-3 align-items-center">
          <span class="picture-name">{{ dataStore.data.basics.picture }}</span>
          <button @click="dataStore.clearPicture" :title="localeStore.getAppMessage('editor.data.picture.clear')">
            <i class="fas fa-times" />
          </button>
        </div>
        <FilePicker
            :label="localeStore.getAppMessage('editor.data.picture.upload')"
            accept="image/*"
            @select="uploadPicture"
            v-else
        />
      </div>

      <NumberInput
          v-model="styleStore.style.pictureTranslateX"
          :label="localeStore.getAppMessage('editor.data.picture.translateX')"
          :step="1"
          :max-fraction-digits="0"
          suffix="px"
      />
      <NumberInput
          v-model="styleStore.style.pictureTranslateY"
          :label="localeStore.getAppMessage('editor.data.picture.translateY')"
          :step="1"
          :max-fraction-digits="0"
          suffix="px"
      />
      <NumberInput
          v-model="styleStore.style.pictureScale"
          :label="localeStore.getAppMessage('editor.data.picture.scale')"
          :min="0.1"
          :step="0.1"
      />
    </div>
  </Section>
  <Section name="about" icon="fas fa-user" v-model="dataStore.data.basics.profiles">
  <Textarea
      auto-resize
      id="summary"
      v-model="dataStore.data.basics.summary"
      :placeholder="localeStore.getAppMessage('editor.data.basics.summaryPlaceholder')"
      style="width:100%"
      class="mb-2 mt-2"
  />
  </Section>

  <Section name="contact" icon="fas fa-link" v-model="dataStore.data.basics.profiles" :hideable="false">
    <VueDraggable v-model="dataStore.data.basics.profiles" handle=".handle">
      <InputItem
          v-for="(profile, index) in dataStore.data.basics.profiles"
          :key="index"
          v-model="dataStore.data.basics.profiles[index]"
          @delete="removeElement(dataStore.data.basics.profiles, index)"
      >
        <div class="grid-3">
          <!-- TODO Integrate with predefined set of networks -->
          <TextInput
              v-model="profile.network"
              :label="localeStore.getAppMessage('editor.data.profiles.network')"
              :options="getProfileNames()"
          />
          <TextInput v-model="profile.url" :label="localeStore.getAppMessage('editor.data.profiles.url')" />
          <TextInput v-model="profile.text" :label="localeStore.getAppMessage('editor.data.profiles.text')" />
        </div>
      </InputItem>
    </VueDraggable>
    <button @click="dataStore.addProfile" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.profiles.addProfile') }}
    </button>
  </Section>
  <Section name="work" icon="fas fa-briefcase">
    <VueDraggable v-model="dataStore.data.work" handle=".handle">
      <InputItem
          v-for="(work, index) in dataStore.data.work"
          :key="index"
          v-model="dataStore.data.work[index]"
          @delete="removeElement(dataStore.data.work, index)"
      >
        <div class="grid-3">
          <TextInput v-model="work.name" :label="localeStore.getAppMessage('editor.data.work.name')" />
          <TextInput v-model="work.position" :label="localeStore.getAppMessage('editor.data.work.position')" />
          <TextInput v-model="work.location" :label="localeStore.getAppMessage('editor.data.work.location')" />
          <TextInput v-model="work.startDate" :label="localeStore.getAppMessage('editor.data.work.startDate')" />
          <TextInput v-model="work.endDate" :label="localeStore.getAppMessage('editor.data.work.endDate')" />
          <TextInput v-model="work.url" :label="localeStore.getAppMessage('editor.data.work.url')" />
        </div>

        <label :for="'summary-' + index" class="font-bold block mb-3 mt-3">
          {{ localeStore.getAppMessage('editor.data.work.summary') }}
        </label>
        <Textarea
            auto-resize
            :id="'summary-' + index"
            v-model="work.summary"
            :placeholder="localeStore.getAppMessage('editor.data.work.summaryPlaceholder')"
            style="width:100%"
        />

        <label :for="'highlight-' + index + '-' + 0" class="font-bold block mb-3 mt-3">
          {{ localeStore.getAppMessage('editor.data.work.highlights') }}
        </label>
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
          <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.work.addHighlight') }}
        </button>
      </InputItem>
    </VueDraggable>

    <button @click="dataStore.addExperience" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.work.addExperience') }}
    </button>
  </Section>

  <Section name="projects" icon="fas fa-diagram-project">
    <VueDraggable v-model="dataStore.data.projects" handle=".handle">
      <InputItem
          v-for="(project, index) in dataStore.data.projects"
          :key="index"
          v-model="dataStore.data.projects[index]"
          @delete="removeElement(dataStore.data.projects, index)"
      >
        <div class="grid-2">
          <TextInput v-model="project.name" :label="localeStore.getAppMessage('editor.data.projects.name')" />
          <TextInput v-model="project.url" :label="localeStore.getAppMessage('editor.data.projects.url')" />
          <TextInput v-model="project.startDate" :label="localeStore.getAppMessage('editor.data.projects.startDate')" />
          <TextInput v-model="project.endDate" :label="localeStore.getAppMessage('editor.data.projects.endDate')" />
        </div>

        <label :for="'project-summary-' + index" class="font-bold block mb-3 mt-3">
          {{ localeStore.getAppMessage('editor.data.projects.description') }}
        </label>
        <Textarea
            auto-resize
            :id="'project-summary-' + index"
            v-model="project.description"
            :placeholder="localeStore.getAppMessage('editor.data.projects.descriptionPlaceholder')"
            style="width:100%"
        />

        <label :for="'project-highlight-' + index + '-' + 0" class="font-bold block mb-3 mt-3">
          {{ localeStore.getAppMessage('editor.data.projects.highlights') }}
        </label>
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
          <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.projects.addHighlight') }}
        </button>
      </InputItem>
    </VueDraggable>

    <button @click="dataStore.addProject" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.projects.addProject') }}
    </button>
  </Section>

  <Section name="publications" icon="fas fa-book">
    <VueDraggable v-model="dataStore.data.publications" handle=".handle">
      <InputItem
          v-for="(publication, index) in dataStore.data.publications"
          :key="index"
          v-model="dataStore.data.publications[index]"
          @delete="removeElement(dataStore.data.publications, index)"
      >
        <div class="grid-2">
          <TextInput v-model="publication.name" :label="localeStore.getAppMessage('editor.data.publications.name')" />
          <TextInput v-model="publication.url" :label="localeStore.getAppMessage('editor.data.publications.url')" />
          <TextInput v-model="publication.publisher" :label="localeStore.getAppMessage('editor.data.publications.publisher')" />
          <TextInput v-model="publication.releaseDate" :label="localeStore.getAppMessage('editor.data.publications.releaseDate')" />
        </div>

        <label :for="'publication-summary-' + index" class="font-bold block mb-3 mt-3">
          {{ localeStore.getAppMessage('editor.data.publications.summary') }}
        </label>
        <Textarea
            auto-resize
            :id="'publication-summary-' + index"
            v-model="publication.summary"
            :placeholder="localeStore.getAppMessage('editor.data.publications.summaryPlaceholder')"
            style="width:100%"
        />
      </InputItem>
    </VueDraggable>

    <button @click="dataStore.addPublication" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.publications.addPublication') }}
    </button>
  </Section>

  <Section name="conferences" icon="fas fa-microphone">
    <VueDraggable v-model="dataStore.data.conferences" handle=".handle">
      <InputItem
          v-for="(conference, index) in dataStore.data.conferences"
          :key="index"
          v-model="dataStore.data.conferences[index]"
          @delete="removeElement(dataStore.data.conferences, index)"
      >
        <div class="grid-2">
          <TextInput v-model="conference.title" :label="localeStore.getAppMessage('editor.data.conferences.title')" />
          <TextInput v-model="conference.conference" :label="localeStore.getAppMessage('editor.data.conferences.conference')" />
          <TextInput v-model="conference.location" :label="localeStore.getAppMessage('editor.data.conferences.location')" />
          <TextInput v-model="conference.time" :label="localeStore.getAppMessage('editor.data.conferences.time')" />
          <TextInput v-model="conference.url" :label="localeStore.getAppMessage('editor.data.conferences.url')" />
        </div>

        <label :for="'conference-summary-' + index" class="font-bold block mb-3 mt-3">
          {{ localeStore.getAppMessage('editor.data.conferences.summary') }}
        </label>
        <Textarea
            auto-resize
            :id="'conference-summary-' + index"
            v-model="conference.summary"
            :placeholder="localeStore.getAppMessage('editor.data.conferences.summaryPlaceholder')"
            style="width:100%"
        />
      </InputItem>
    </VueDraggable>

    <button @click="dataStore.addConference" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.conferences.addConference') }}
    </button>
  </Section>

  <Section name="education" icon="fas fa-graduation-cap">
    <VueDraggable v-model="dataStore.data.education" handle=".handle">
      <InputItem
          v-for="(education, index) in dataStore.data.education"
          :key="index"
          v-model="dataStore.data.education[index]"
          @delete="removeElement(dataStore.data.education, index)"
      >
        <div class="grid-2">
          <TextInput v-model="education.institution" :label="localeStore.getAppMessage('editor.data.education.institution')" />
          <TextInput v-model="education.studyType" :label="localeStore.getAppMessage('editor.data.education.studyType')" />
          <TextInput v-model="education.startDate" :label="localeStore.getAppMessage('editor.data.education.startDate')" />
          <TextInput v-model="education.endDate" :label="localeStore.getAppMessage('editor.data.education.endDate')" />
          <TextInput v-model="education.url" :label="localeStore.getAppMessage('editor.data.education.url')" />
        </div>
      </InputItem>
    </VueDraggable>

    <button @click="dataStore.addEducation" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.education.addEducation') }}
    </button>
  </Section>

  <Section name="certificates" icon="fas fa-award">
    <VueDraggable v-model="dataStore.data.certificates" handle=".handle">
      <InputItem
          v-for="(certificate, index) in dataStore.data.certificates"
          :key="index"
          v-model="dataStore.data.certificates[index]"
          @delete="removeElement(dataStore.data.certificates, index)"
      >
        <div class="grid-2">
          <TextInput v-model="certificate.name" :label="localeStore.getAppMessage('editor.data.certificates.name')" />
          <TextInput v-model="certificate.issuer" :label="localeStore.getAppMessage('editor.data.certificates.issuer')" />
          <TextInput v-model="certificate.date" :label="localeStore.getAppMessage('editor.data.certificates.date')" />
          <TextInput v-model="certificate.url" :label="localeStore.getAppMessage('editor.data.certificates.url')" />
        </div>
      </InputItem>
    </VueDraggable>

    <button @click="dataStore.addCertificate" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.certificates.addCertificate') }}
    </button>
  </Section>

  <Section name="awards" icon="fas fa-trophy">
    <VueDraggable v-model="dataStore.data.awards" handle=".handle">
      <InputItem
          v-for="(award, index) in dataStore.data.awards"
          :key="index"
          v-model="dataStore.data.awards[index]"
          @delete="removeElement(dataStore.data.awards, index)"
      >
        <div class="grid-2">
          <TextInput v-model="award.title" :label="localeStore.getAppMessage('editor.data.awards.title')" />
          <TextInput v-model="award.awarder" :label="localeStore.getAppMessage('editor.data.awards.awarder')" />
          <TextInput v-model="award.date" :label="localeStore.getAppMessage('editor.data.awards.date')" />
          <TextInput v-model="award.url" :label="localeStore.getAppMessage('editor.data.awards.url')" />
        </div>
      </InputItem>
    </VueDraggable>

    <button @click="dataStore.addAward" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.awards.addAward') }}
    </button>
  </Section>

  <Section name="skills" icon="fas fa-brain">
    <VueDraggable v-model="dataStore.data.skills" handle=".handle">
      <InputItem
          v-for="(skill, index) in dataStore.data.skills"
          :key="index"
          v-model="dataStore.data.skills[index]"
          @delete="removeElement(dataStore.data.skills, index)"
      >
        <div class="grid-2">
          <TextInput v-model="skill.name" :label="localeStore.getAppMessage('editor.data.skills.name')" />
        </div>
        <label :for="'keywords-' + index" class="font-bold block mb-2 mt-2">
          {{ localeStore.getAppMessage('editor.data.skills.keywords') }}
        </label>
        <InputChips
            :placeholder="localeStore.getAppMessage('editor.data.skills.addKeyword')"
            v-model="skill.keywords"
            :input-id="'keywords-' + index"
        />
      </InputItem>
    </VueDraggable>

    <button @click="dataStore.addSkill" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.skills.addSkill') }}
    </button>
  </Section>

  <Section name="languages" icon="fas fa-language">
    <VueDraggable v-model="dataStore.data.languages" handle=".handle">
      <InputItem
          v-for="(language, index) in dataStore.data.languages"
          :key="index"
          v-model="dataStore.data.languages[index]"
          @delete="removeElement(dataStore.data.languages, index)"
      >
        <div class="grid-2">
          <TextInput v-model="language.language" :label="localeStore.getAppMessage('editor.data.languages.language')" />
          <TextInput v-model="language.fluency" :label="localeStore.getAppMessage('editor.data.languages.fluency')" />
        </div>
      </InputItem>
    </VueDraggable>

    <button @click="dataStore.addLanguage" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.languages.addLanguage') }}
    </button>
  </Section>

  <Section name="interests" icon="fas fa-star">
    <VueDraggable v-model="dataStore.data.interests" handle=".handle">
      <InputItem
          v-for="(interest, index) in dataStore.data.interests"
          :key="index"
          v-model="dataStore.data.interests[index]"
          @delete="removeElement(dataStore.data.interests, index)"
      >
        <div class="grid-2">
          <TextInput v-model="interest.name" :label="localeStore.getAppMessage('editor.data.interests.name')" />
        </div>
        <label :for="'keywords-' + index" class="font-bold block mb-2 mt-2">
          {{ localeStore.getAppMessage('editor.data.interests.keywords') }}
        </label>
        <InputChips
            :placeholder="localeStore.getAppMessage('editor.data.interests.addKeyword')"
            v-model="interest.keywords"
            :input-id="'keywords-' + index"
        />
      </InputItem>
    </VueDraggable>

    <button @click="dataStore.addInterest" class="button-add">
      <i class="fas fa-plus"></i> {{ localeStore.getAppMessage('editor.data.interests.addInterest') }}
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
