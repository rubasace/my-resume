<script setup>

const model = defineModel({
  required: false
})

</script>

<template>
  <div class="input-item" :class="model?.hidden ? 'hidden-input' : ''">
    <div class="content">
      <slot/>
    </div>

    <div class="actions">
      <i class="fas fa-trash" @click="emit('delete')"></i>
      <!-- TODO handle show/hide state -->
      <i :class="model?.hidden ? 'fas fa-eye-slash' : 'fas fa-eye'" @click="() => model.hidden = !model?.hidden" v-if="model"></i>
      <i class="fas fa-bars handle"></i>
    </div>
  </div>
</template>

<style scoped lang="sass">
.input-item
  width: 100%
  border: 1px solid #333
  margin: 1em auto
  border-radius: 10px
  display: flex
  align-items: center

  &:hover
    .actions
      opacity: 1

  &.hidden-input
    opacity: 30%

  .content
    flex-grow: 1
    padding: 1em 2em

  .actions
    display: flex
    gap: 1em
    align-items: center
    margin: 0 1em
    opacity: 0.1

    i
      cursor: pointer
      font-size: 1em
      transition: color 0.2s

      &:hover
        color: var(--p-primary-color)
</style>