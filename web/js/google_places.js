let input = document.getElementById('autocomplete');
let autocomplete;
autocomplete = new google.maps.places.Autocomplete(input, {types: ['geocode']});
autocomplete.setFields(['address_component']);
let placeInput = document.getElementById('autocomplete2');
let placeAutocomplete;
initAutocomplete();
let suggestions = [];
let place;
let resolvePlace;


setInterval(() => {
    clearSuggestions();
    const pacItems = document.getElementsByClassName('pac-item');
    if (!!pacItems && pacItems.length > 0) {
        const newSuggestions = [];
        for (const item of pacItems) {
            let suggestion = '';
            let index = 0;
            for (const span of item.children) {
                if (!!span.textContent && span.textContent.trim().length > 0) {
                    suggestion = index !== item.children.length - 1 ?
                        suggestion + span.textContent + ', ' : suggestion + span.textContent;
                }
                index++;
            }
            newSuggestions.push(suggestion);
        }
        suggestions = [...newSuggestions];
        input.dispatchEvent(new Event('suggestionsChange'));
    }
}, 20);

async function setNativeInputValue(text) {
    input.setAttribute('value', text);
    input.focus();
    input.dispatchEvent(new Event('valueChange'));
    input.dispatchEvent(new Event('keydown'));
    input.dispatchEvent(new Event('suggestionsChange'));
}

function getSuggestions() {
    return [...suggestions];
}

function clearSuggestions() {
    suggestions = [];
    input.dispatchEvent(new Event('suggestionsChange'));
}

function autoCompleteListener() {
    // Get the place details from the autocomplete object.
    place = placeAutocomplete.getPlace();
    resolvePlace = {
        'street_number': '',
        'route': '',
        'locality': '',
        'administrative_area_level_1': '',
        'country': '',
        'postal_code': '',
    };
    if (!!place && !!place.address_components) {
        const addressComponents = [...place.address_components];
        addressComponents.forEach(component => {
            if (component.types.includes('street_number')) {
                resolvePlace.street_number = component.long_name;
            }
            if (component.types.includes('route')) {
                resolvePlace.route = component.long_name;
            }
            if (component.types.includes('locality')) {
                resolvePlace.locality = component.long_name;
            }
            if (component.types.includes('administrative_area_level_1')) {
                resolvePlace.administrative_area_level_1 = component.long_name;
            }
            if (component.types.includes('country')) {
                resolvePlace.country = component.long_name;
            }
            if (component.types.includes('postal_code')) {
                resolvePlace.postal_code = component.long_name;
            }
        });
        console.log({resolvePlace});
        placeInput.dispatchEvent(new Event('placeChange'));
    }
}

function getPlaceObject(address) {
    place = null;
    return new Promise((resolve) => {
        placeInput.setAttribute('value', address);
        placeInput.focus();
        placeInput.dispatchEvent(new Event('valueChange'));
        placeInput.dispatchEvent(new Event('keydown'));
        const keyDownEvent = new Event('keydown');
        keyDownEvent.keyCode = 40;
        const keyEnterEvent = new Event('keydown');
        keyEnterEvent.keyCode = 13;
        setTimeout(() => {
            placeInput.dispatchEvent(keyDownEvent);
            placeInput.dispatchEvent(keyEnterEvent);
            placeInput.addEventListener('placeChange', () => {
                clearService();
                resolve(JSON.stringify(resolvePlace));
            });
        }, 1000);
    });
}

function initAutocomplete() {
    placeAutocomplete = new google.maps.places.Autocomplete(placeInput, {types: ['geocode']});
    placeAutocomplete.setFields(['address_component']);
    placeAutocomplete.addListener('place_changed', autoCompleteListener);
}

function clearService() {
    placeInput.remove();
    const newInput = document.createElement('input');
    newInput.id = 'autocomplete2';
    document.getElementsByTagName('body')[0].append(newInput);
    placeInput = document.getElementById('autocomplete2');
    initAutocomplete();
}