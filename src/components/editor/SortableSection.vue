<script setup>

defineProps({
  name: String
});

</script>

<template>
  <div class="sortable-section">
    <div class="content">
      {{$t("section." + name)}}
    </div>
    <div class="actions">
      <i class="fas fa-bars handle"></i>
    </div>
  </div>
</template>

<style scoped lang="sass">
.sortable-section
  width: 100%
  border: 1px solid #333
  margin: 1em auto
  border-radius: 10px
  display: flex
  align-items: center
  font-size: 0.8em

  .content
    flex-grow: 1
    padding: 1em 2em
    text-transform: capitalize

  .actions
    display: flex
    gap: 1em
    align-items: center
    margin: 0 1em

    i
      cursor: pointer
      font-size: 1em
      transition: color 0.2s

      &:hover
        color: var(--p-primary-color)
</style>