nav_button = document.querySelector('.nav-button')
navigation = document.querySelector('.navigation')

# Listen for click event
nav_button.addEventListener 'click', (->

  # open navigation and change toggle button
  navigation.classList.toggle 'open'
  nav_button.classList.toggle 'active'
), false

# document.addEventListener "DOMContentLoaded", ->
#   searchInput = document.getElementById 'searchInput'
#   priceFilter = document.getElementById 'priceFilter'
#   productRows = document.querySelectorAll '.product-row' # Assuming each product is in a div with class 'product-row'

#   searchInput.addEventListener 'input', (e) ->
#     console.log 'Search term:', e.target.value
#     searchTerm = e.target.value.toLowerCase()

#     productRows.forEach (row) ->
#       productTitleElement = row.querySelector('.product .title h3')
#       if productTitleElement
#         product = productTitleElement.textContent.toLowerCase()
#         row.style.display = if product.includes(searchTerm) then '' else 'none'
#       else
#         console.error 'Product title element not found in row:', row

document.addEventListener 'DOMContentLoaded', ->
  searchInput = document.getElementById 'searchInput'
  priceFilter = document.getElementById 'priceFilter'
  productRows = document.querySelectorAll '.product-row'

  filterProducts = ->
    searchTerm = searchInput.value.toLowerCase()
    selectedPriceRange = priceFilter.value.split('-')

    for row in productRows
      productTitle = row.querySelector('.product-content .title h3').textContent.toLowerCase()
      productPrice = parseFloat(row.getAttribute('data-price'))

      priceInRange = true
      if selectedPriceRange[0]
        minPrice = parseFloat(selectedPriceRange[0])
        priceInRange = priceInRange and productPrice >= minPrice
      if selectedPriceRange[1]
        maxPrice = parseFloat(selectedPriceRange[1])
        priceInRange = priceInRange and productPrice <= maxPrice

      if productTitle.includes(searchTerm) and priceInRange
        row.style.display = ''
      else
        row.style.display = 'none'

  searchInput.addEventListener 'input', filterProducts
  priceFilter.addEventListener 'change', filterProducts
