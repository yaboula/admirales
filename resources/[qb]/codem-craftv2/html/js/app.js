const Modules = {};
let audioPlayer = null;
const store = Vuex.createStore({
    components: {},

    state: {
        notifications: [],
        timeout: false
    },
    getters: {},
    mutations: {},
    actions: {
        soundPlay({ state }, val) {
            clicksound(val);
            // this.$store.dispatch("soundPlay", "mbillingcreate.wav");
        },
        notification({ state }, text) {
            const timeout = 3000;
            let id = Date.now();
            if (state.notifications.some(notification => notification.text === text)) {
                return;
            }

            let newNotification = {
                id: id,
                text: text,
                timeout: setTimeout(() => {
                    state.notifications = state.notifications.filter(notification => notification.id != id);
                }, timeout)
            };

            state.notifications.push(newNotification);
        }
    },

    modules: Modules
});

const app = Vue.createApp({
    components: {},
    data: () => ({
        show: false,
        craftpage: "", // history item // blueprints
        imagesFolder: false,
        playerAccount: false,
        configData: false,
        selectedCategory: "all",
        selectedIndexHover: null,
        selectedItemInformation: false,
        learnedSearchbarValue: "",
        selectedCraftItems: false,
        playerClientInventory: false,
        learnRequiredItems: false,
        delayed: false,
        ingredientsItems: {},
        itemCountInventory: 1,
        skillTreePageValue: false,
        skillTree: [],
        requiredXP: false,
        calculateXp: 0,
        activeCountdowns: [],
        searchHistory: "",
        dismantleItemValue: false,
        dismantleItemPage: false,
        showTooltip: false,
        dismantleSwiperValue: false,
        improveBG: false,
        searchBlueprints: "",
        locales: false,
        accessAnywhere  : false
    }),

    watch: {},

    beforeDestroy() {
        window.removeEventListener("keyup", this.updateNavbarActive);
    },
    mounted() {
        window.addEventListener("keyup", this.keyHandler);
        window.addEventListener("message", this.eventHandler);
        setTimeout(() => {
            this.mainInventoryDrag();
            this.mainInventoryDrop();
        }, 500);
    },

    methods: {
        improveCraft() {
            this.improveBG = !this.improveBG;
        },
        setDismantleItem(val) {
            if (val) {
                postNUI("setDismantleItem", val);
                this.dismantleItemValue = false;
                this.dismantleItemPage = false;
                this.delayed = false;
            }
        },

        getBackgroundImage(activepage) {
            if (this.improveBG) {
                return "url(./images/improvebg.png)";
            }

            if (activepage == "item" || activepage == "notitem") {
                return "url(./images/mainbg.png)";
            } else {
                return "url(./images/mainbg2.png)";
            }
        },
        dismantleSwiper() {
            if (this.dismantleSwiperValue) {
                this.dismantleSwiperValue.destroy();
            }

            this.dismantleSwiperValue = new Swiper("#mainswiper", {
                slidesPerView: 1,
                loop: false,
                spaceBetween: 100,
                slidesPerGroup: 1,
                navigation: {
                    nextEl: "#mainswiperleft",
                    prevEl: "#mainswiperright"
                },
                pagination: {
                    el: ".swiper-pagination"
                }
            });
        },
        closeDismantleModal() {
            this.dismantleItemValue = false;
            this.dismantleItemPage = false;
            this.delayed = false;
        },
        dismantleItemFunction() {
            if (this.dismantleItemValue) {
                if (this.selectedCraftItems.name.toLowerCase() == this.dismantleItemValue.name.toLowerCase()) {
                    this.dismantleItemPage = true;
                    setTimeout(() => {
                        this.dismantleSwiper();
                    }, 600);
                } else {
                    this.$store.dispatch("notification", this.locales["youneedtochoseanitem"]);
                }

                setTimeout(() => {
                    this.delayed = true;
                }, 500);
            } else {
                this.$store.dispatch("notification", this.locales["youneedtoitem"]);
            }
        },
        dismantleItem(val) {
            this.dismantleItemValue = val;
        },
        startCountdownForItem(item) {
            const uniqueKey = `${item.uniqueID}`;
            const existingCountdown = this.activeCountdowns.find(cd => `${cd.uniqueID}` === uniqueKey);
            if (existingCountdown) {
                return;
            }
            const countdown = {
                item: item,
                remainingTime: item.time * 60,
                timeoutId: null,
                uniqueID: uniqueKey
            };
            this.activeCountdowns.push(countdown);
            countdown.timeoutId = setTimeout(() => this.decrementCountdown(countdown), 1000);
        },

        decrementCountdown(countdown) {
            if (countdown.remainingTime > 0) {
                countdown.remainingTime--;
                this.$forceUpdate();
                if (countdown.timeoutId) {
                    clearTimeout(countdown.timeoutId);
                }

                countdown.timeoutId = setTimeout(() => this.decrementCountdown(countdown), 1000);
            } else {
                clearTimeout(countdown.timeoutId);

                const index = this.activeCountdowns.indexOf(countdown);
                if (index !== -1) {
                    if (this.playerAccount.allData.craftinglistdata) {
                        this.playerAccount.allData.craftinglistdata.forEach(element => {
                            if (element.uniqueID == countdown.uniqueID) {
                                element.claim = true;
                                setTimeout(() => {
                                    postNUI("finishItemTime", element);
                                }, 1000);
                            }
                        });
                    }

                }
            }
        },

        formattedTime(seconds) {
            const minutes = Math.floor(seconds / 60);
            const remainingSeconds = seconds % 60;
            return `${minutes} ${this.locales["min"]} ${remainingSeconds < 10 ? "0" : ""}${remainingSeconds.toFixed(0)} ${this.locales["secleft"]} `;
        },
        formatString(template, ...values) {
            return template.replace(/%s/g, () => values.shift());
        },
        claimItem(val) {
            const countdown = this.activeCountdowns.find(cd => cd.uniqueID === val.uniqueID);
            if (countdown) {
                if (countdown.remainingTime <= 0) {
                    postNUI("claimItem", val);
                    this.$store.dispatch("soundPlay", "finishcraft.mp3");
                } else {
                    let message = this.formatString(this.locales["timeremaining"], countdown.remainingTime);
                    this.$store.dispatch("notification", message);
                }
            }
        },
        deleteCraftingListItems(val) {
            if (val) {
                postNUI("deleteCraftingListItems", val);
                const index = this.activeCountdowns.findIndex(cd => cd.uniqueID === val.uniqueID);
                if (index !== -1) {
                    clearTimeout(this.activeCountdowns[index].timeoutId);
                }
            }
        },
        learnSkillTree(val) {
            if (val) {
                postNUI("learnSkillTree", val);
                this.skillTreePageValue = false;
            }
        },
        selectSkillTree(val) {
            if (val.categories == "timeboost") {
                let currentIndex = val.currentLevel == 0 ? 0 : this.skillTree.timeboost.findIndex(item => item.level == val.currentLevel);
                if (currentIndex !== -1) {
                    if (currentIndex === this.skillTree.timeboost.length - 1) {
                        this.$store.dispatch("notification", this.locales["youcantlearn"]);
                        return;
                    }
                    if (currentIndex == 0) {
                        let nextItem = this.skillTree.timeboost[currentIndex];
                        val.craftPoint = nextItem.craftPoint || 999999;
                        val.nextLevel = nextItem.level;
                        val.headerText = this.locales["everycrafting"] + nextItem.level + "%";
                        this.skillTreePageValue = val;
                        return;
                    }
                    let nextItem = this.skillTree.timeboost[currentIndex + 1];
                    val.craftPoint = nextItem.craftPoint || 999999;
                    val.nextLevel = nextItem.level;
                    val.headerText = this.locales["everycrafting"] + nextItem.level + "%";
                    this.skillTreePageValue = val;
                }
            }

            if (val.categories == "chanceboost") {
                let currentIndex = val.currentLevel == 0 ? 0 : this.skillTree.chanceboost.findIndex(item => item.level == val.currentLevel);
                if (currentIndex !== -1) {
                    if (currentIndex === this.skillTree.chanceboost.length - 1) {
                        this.$store.dispatch("notification", this.locales["youcantlearn"]);
                        return;
                    }
                    if (currentIndex == 0) {
                        let nextItem = this.skillTree.chanceboost[currentIndex];
                        val.craftPoint = nextItem.craftPoint || 999999;
                        val.nextLevel = nextItem.level;
                        val.headerText = this.locales["reducesthechance"] + nextItem.level + "%";
                        this.skillTreePageValue = val;
                        return;
                    }
                    let nextItem = this.skillTree.chanceboost[currentIndex + 1];
                    val.craftPoint = nextItem.craftPoint || 999999;
                    val.nextLevel = nextItem.level;
                    val.headerText = this.locales["reducesthechance"] + nextItem.level + "%";
                    this.skillTreePageValue = val;
                }
            }
            if (val.categories == "xpboost") {
                let currentIndex = val.currentLevel == 0 ? 0 : this.skillTree.xpboost.findIndex(item => item.level == val.currentLevel);
                if (currentIndex !== -1) {
                    if (currentIndex === this.skillTree.xpboost.length - 1) {
                        this.$store.dispatch("notification", this.locales["youcantlearn"]);
                        return;
                    }
                    if (currentIndex == 0) {
                        let nextItem = this.skillTree.xpboost[currentIndex];
                        val.craftPoint = nextItem.craftPoint || 999999;
                        val.nextLevel = nextItem.level;
                        val.headerText = this.locales["givesxpboost"] + nextItem.level + "%";
                        this.skillTreePageValue = val;
                        return;
                    }
                    let nextItem = this.skillTree.xpboost[currentIndex + 1];
                    val.craftPoint = nextItem.craftPoint || 999999;
                    val.nextLevel = nextItem.level;
                    val.headerText = this.locales["givesxpboost"] + nextItem.level + "%";
                    this.skillTreePageValue = val;
                }
            }
            if (val.categories == "cpboost") {
                let currentIndex = val.currentLevel == 0 ? 0 : this.skillTree.cpboost.findIndex(item => item.level == val.currentLevel);
                if (currentIndex !== -1) {
                    if (currentIndex === this.skillTree.cpboost.length - 1) {
                        this.$store.dispatch("notification", this.locales["youcantlearn"]);
                        return;
                    }
                    if (currentIndex == 0) {
                        let nextItem = this.skillTree.cpboost[currentIndex];
                        val.craftPoint = nextItem.craftPoint || 999999;
                        val.nextLevel = nextItem.level;
                        val.headerText = this.locales["givescpboost"] + nextItem.level + "%";
                        this.skillTreePageValue = val;
                        return;
                    }
                    let nextItem = this.skillTree.cpboost[currentIndex + 1];
                    val.craftPoint = nextItem.craftPoint || 999999;
                    val.nextLevel = nextItem.level;
                    val.headerText = this.locales["givescpboost"] + nextItem.level + "%";
                    this.skillTreePageValue = val;
                }
            }
        },
        checkInput() {
            if (!this.itemCountInventory.match(/^[1-9][0-9]*$/)) {
                this.itemCountInventory = "1";
            }
        },
        craftSetItems(val) {
            if (val) {
                let unlearnedItems = this.selectedCraftItems.requiredItems.filter(item => !item.learn);

                if (unlearnedItems.length > 0) {
                    this.$store.dispatch("notification", this.locales["notlearned"]);
                    return;
                }
                const ingredientsItemsLength = Object.keys(this.ingredientsItems).length;
                const selectedItemLength = this.selectedCraftItems.requiredItems.length;
                if (ingredientsItemsLength < selectedItemLength) {
                    this.$store.dispatch("notification", this.locales["didntplace"]);
                    return;
                } else {
                    this.selectedCraftItems.uniqueID = this.generateUniqueID();
                    this.$store.dispatch("soundPlay", "startcraft.mp3");
                    postNUI("craftSetItems", {
                        craftItems: this.selectedCraftItems,
                        otherInventory: this.ingredientsItems,
                        improvePrice: this.improveBG
                    });
                }
            }
        },
        learnCraftItem(val) {
            if (val) {
                postNUI("learnCraftItem", { learnData: val, selectedItem: this.selectedCraftItems });
            }
        },

        mainInventoryDrag() {
            $(".mainInventorySlot").draggable({
                helper: "clone",
                revertDuration: 0,
                revert: false,
                cancel: ".item-nodrag",
                containment: "",
                scroll: false,
                start: function (event, ui) {
                    $(this).data("fromMainInventory", true);
                    ui.helper.css("width", "8.5%");
                    ui.helper.css("height", "12%");
                    ui.helper.css("opacity", "0.0");
                    ui.helper.css("z-index", "10");

                    ui.helper.animate(
                        {
                            opacity: 1.0
                        },
                        250
                    );
                },
                drag: function (event, ui) {},
                stop: (event, ui) => {
                    this.mainInventoryDrag();
                    this.mainInventoryDrop();
                }
            });
            $(".otherInventorySlot").draggable({
                helper: "clone",
                revertDuration: 0,
                revert: true,
                cancel: ".item-nodrag",
                containment: "",
                scroll: true,
                start: function (event, ui) {
                    if ($(this).children().length === 0) {
                        event.preventDefault();
                        return;
                    }
                    $(this).data("fromOtherInventory", true);
                    ui.helper.css("width", "8.5%");
                    ui.helper.css("height", "12%");
                    ui.helper.css("opacity", "0.0");
                    ui.helper.css("z-index", "10");

                    ui.helper.animate(
                        {
                            opacity: 1.0
                        },
                        250
                    );
                },
                drag: function (event, ui) {},
                stop: (event, ui) => {
                    this.mainInventoryDrag();
                    this.mainInventoryDrop();
                }
            });
        },
        findFirstEmptySlot(inventory) {
            for (let i = 1; i <= Object.keys(inventory).length; i++) {
                if (!inventory[i]) {
                    return i;
                }
            }
            return Object.keys(inventory).length + 1;
        },
        mainInventoryDrop() {
            $(".mainInventoryDrop").droppable({
                tolerance: "pointer",
                drop: (event, ui) => {
                    if (!$(ui.draggable).data("fromOtherInventory")) {
                        return;
                    }

                    const itemName = $(ui.draggable).attr("data-name");
                    const itemLabel = $(ui.draggable).attr("data-label");
                    let itemAmount = parseInt($(ui.draggable).attr("data-amount"), 10);
                    const itemSlot = $(ui.draggable).attr("data-slot");

                    if (itemName === undefined) {
                        event.preventDefault();
                        return;
                    }
                    if (itemAmount < this.itemCountInventory) {
                        this.$store.dispatch("notification", this.locales["notitems"]);
                        return;
                    }
                    if (this.itemCountInventory && this.itemCountInventory <= 0) {
                        this.$store.dispatch("notification", this.locales["amountisnotvalid"]);
                        return;
                    }
                    if (this.itemCountInventory > 0 && this.itemCountInventory <= itemAmount) {
                        itemAmount = Number(this.itemCountInventory);
                    }

                    let existingItemKey = Object.keys(this.playerClientInventory).find(key => this.playerClientInventory[key].name === itemName);

                    if (existingItemKey) {
                        this.playerClientInventory[existingItemKey].count += itemAmount; // Öğe zaten varsa miktarını güncelle
                    } else {
                        let emptySlot = this.findFirstEmptySlot(this.playerClientInventory);
                        this.playerClientInventory[emptySlot] = {
                            name: itemName,
                            label: itemLabel,
                            count: itemAmount
                        };
                    }
                    this.ingredientsItems[itemSlot].amount -= itemAmount;
                    if (this.ingredientsItems[itemSlot].amount <= 0) {
                        delete this.ingredientsItems[itemSlot];
                    }
                }
            });
            $(".otherInventoryDrop").droppable({
                tolerance: "pointer",
                drop: (event, ui) => {
                    if (!$(ui.draggable).data("fromMainInventory")) {
                        return;
                    }

                    const itemName = $(ui.draggable).attr("data-name");
                    const itemLabel = $(ui.draggable).attr("data-label");
                    let itemAmount = parseInt($(ui.draggable).attr("data-amount"), 10);
                    const itemSlot = $(ui.draggable).attr("data-slot");

                    if (itemName === undefined) {
                        event.preventDefault();
                        return;
                    }
                    if (itemAmount < this.itemCountInventory) {
                        this.$store.dispatch("notification", this.locales["notitems"]);
                        return;
                    }
                    if (this.itemCountInventory && this.itemCountInventory <= 0) {
                        this.$store.dispatch("notification", this.locales["amountisnotvalid"]);
                        return;
                    }

                    if (this.itemCountInventory > 0 && this.itemCountInventory <= itemAmount) {
                        itemAmount = Number(this.itemCountInventory);
                    }

                    if (itemName === undefined) {
                        event.preventDefault();
                        return;
                    }
                    let existingItemKey = Object.keys(this.ingredientsItems).find(key => this.ingredientsItems[key].name === itemName);

                    if (existingItemKey) {
                        this.ingredientsItems[existingItemKey].amount += itemAmount; // Öğe zaten varsa miktarını güncelle
                    } else {
                        let lastIndex = Object.keys(this.ingredientsItems).reduce((max, key) => Math.max(max, parseInt(key, 10)), 0);

                        if (lastIndex == 0) {
                            lastIndex = 1;
                        }
                        const nextIndex = String(lastIndex + 1); // Sonraki indis numarasını bul
                        this.ingredientsItems[nextIndex] = {
                            name: itemName,
                            label: itemLabel,
                            amount: itemAmount
                        };
                    }
                    this.playerClientInventory[itemSlot].count -= itemAmount;
                    if (this.playerClientInventory[itemSlot].count <= 0) {
                        delete this.playerClientInventory[itemSlot];
                    }
                }
            });
        },

        changePage(val) {
            if (val == this.craftPage) return;
            this.selectedCraftItems = false;
            this.improveBG = false;
            this.craftpage = val;
        },
        learnRequiredItemsFunction(val) {
            if (!val) {
                this.delayed = false;
                setTimeout(() => {
                    this.learnRequiredItems = val;
                }, 150);
            } else {
                this.learnRequiredItems = val;
                setTimeout(() => {
                    this.delayed = true;
                }, 500);
            }
        },
        craftItems(val) {
            if (val == this.selectedCraftItems) return;
            this.craftpage = "item";
            this.improveBG = false;
            this.selectedCraftItems = val;

            if (!this.selectedCraftItems.originalTime) {
                this.selectedCraftItems.originalTime = this.selectedCraftItems.time;
            }
            if (!this.selectedCraftItems.originalRewardXp) {
                this.selectedCraftItems.originalRewardXp = this.selectedCraftItems.rewardxp;
            }

            if (!this.selectedCraftItems.originalReward) {
                this.selectedCraftItems.originalReward = this.selectedCraftItems.rewardpoint;
            }
            let calculateTime = this.calculateCraftingTime(this.selectedCraftItems.originalTime, this.playerAccount.allData.skilltreedata);
            let calculateReward = this.calculateUpdatedReward(this.selectedCraftItems.originalReward, this.playerAccount.allData.skilltreedata);
            let calculateRewardXp = this.calculateUpdatedRewardXP(this.selectedCraftItems.originalRewardXp, this.playerAccount.allData.skilltreedata);
            this.selectedCraftItems.time = calculateTime;
            this.selectedCraftItems.rewardpoint = calculateReward;
            this.selectedCraftItems.rewardxp = calculateRewardXp;
            this.selectedCraftItems.claim = false;
            this.selectedCraftItems.uniqueID = this.generateUniqueID();

            setTimeout(() => {
                this.mainInventoryDrag();
                this.mainInventoryDrop();
            }, 200);
        },
        calculateCraftingTime(originalTime, playerSkills) {
            let reduction = (originalTime * playerSkills.timeboost) / 100;
            return originalTime - reduction;
        },
        calculateUpdatedReward(originalReward, playerSkills) {
            let bonus = (originalReward * playerSkills.cpboost) / 100;
            return originalReward + bonus;
        },
        calculateUpdatedRewardXP(originalReward, playerSkills) {
            let bonus = (originalReward * playerSkills.xpboost) / 100;
            return originalReward + bonus;
        },

        buyedCraftItem(value) {
            value.craftTableUniqueID = this.configData.craftTableUniqueID[0];
            postNUI("buyedCraftItem", value);
            this.selectedItemInformation = false;
        },
        buyCraftItem(craftPoint) {
            this.selectedItemInformation = craftPoint;
        },
        filterCategory(category) {
            this.selectedCategory = category;
        },
        generateUniqueID() {
            return Date.now().toString(36) + Math.random().toString(36).substr(2, 9);
        },
        formatInventoryData(data) {
            let tempData = {};

            for (let item of data) {
                if (tempData[item.name]) {
                    tempData[item.name].count += item.amount;
                } else {
                    tempData[item.name] = {
                        name: item.name,
                        label: item.label,
                        count: item.amount
                    };
                }
            }
            let formattedData = {};
            let index = 1;
            for (let key in tempData) {
                if (index === 4) {
                    formattedData[String(index)] = {};
                    index++;
                }
                formattedData[String(index)] = tempData[key];
                index++;
            }
            return formattedData;
        },
        eventHandler(event) {
            switch (event.data.action) {
                case "loadnuidata":
                    this.playerAccount = event.data.payload;
                    this.playerAccount.craftinglistdata.forEach(element => {
                        this.startCountdownForItem(element);
                    });
                    break;
                case "openCraftMenu":
                    this.craftpage = "notitem";
                    this.improveBG = false;
                    this.playerAccount = event.data.payload;
                    this.playerClientInventory = this.formatInventoryData(this.playerAccount.inventory);
                    this.calculateXp = (
                        (this.playerAccount.allData.profiledata.xp / this.requiredXP[this.playerAccount.allData.profiledata.level]) *
                        100
                    ).toFixed(0);
                    this.playerAccount.allData.craftinglistdata.forEach(element => {
                        this.startCountdownForItem(element);
                    });
                    break;

                case "CHECK_NUI":
                    postNUI("loaded", true);
                    break;
                case "configData":
                    this.configData = event.data.payload;
                    this.show = true;
                    break;
                case "updateProfileData":
                    if (this.playerAccount.allData.profiledata) {
                        this.playerAccount.allData.profiledata = event.data.payload;
                        this.calculateXp = (
                            (this.playerAccount.allData.profiledata.xp / this.requiredXP[this.playerAccount.allData.profiledata.level]) *
                            100
                        ).toFixed(0);
                    }
                    break;
                case "updateLearnedData":
                    if (this.playerAccount.allData.learneddata) {
                        this.playerAccount.allData.learneddata = event.data.payload;
                        const matchedItem = event.data.payload.find(item => item.name === this.selectedCraftItems.name);
                        if (matchedItem) {
                            this.selectedCraftItems.requiredItems = matchedItem.requiredItems;
                            this.learnRequiredItemsFunction(false);
                        }
                    }
                    break;
                case "imagesFolder":
                    this.imagesFolder = event.data.payload;

                    break;
                case "sendNotification":
                    this.$store.dispatch("notification", event.data.payload);
                    break;
                case "skillTree":
                    this.skillTree = event.data.payload;
                    break;
                case "updateSkillTreeData":
                    this.playerAccount.allData.skilltreedata = event.data.payload;
                    break;
                case "updateCraftingList":
                    this.playerAccount.allData.craftinglistdata = event.data.payload;
                    this.playerAccount.allData.craftinglistdata.forEach(element => {
                        this.startCountdownForItem(element);
                    });
                    break;
                case "requiredXp":
                    this.requiredXP = event.data.payload;
                    break;
                case "updatePlayerInventory":
                    this.playerAccount.inventory = false;
                    this.playerClientInventory = this.formatInventoryData(event.data.payload);
                    this.ingredientsItems = {};
                    break;
                case "updateCraftingHistory":
                    if (this.playerAccount.allData.craftinghistorydata) {
                        this.playerAccount.allData.craftinghistorydata.push(event.data.payload);
                    }
                    break;
                case "configlocales":
                    this.locales = event.data.payload;
                    break;
                case "updateImproveData":
                    this.improveBG = false;
                    break;
                case "accessAnywhere":
                    this.accessAnywhere = event.data.payload;
                    break;
                default:
                    break;
            }
        },
        keyHandler(e) {
            if (e.which == 27) {
                this.show = false;
                postNUI("close");
                this.improveBG = false;
                this.learnRequiredItems = false;
                this.selectedCraftItems = false;
                this.selectedItemInformation = false;
                this.skillTreePageValue = false;
                (this.playerClientInventory = false), (this.learnRequiredItems = false), (this.delayed = false), (this.ingredientsItems = {});
            }
        }
    },
    computed: {
        ...Vuex.mapState({
            notifications: state => state.notifications
        }),

        getColorText() {
            return textColor => {
                if (textColor === "success") {
                    return "rgba(98, 255, 142, 1)";
                } else if (textColor === "error") {
                    return "rgba(255, 98, 98, 1)";
                } else {
                    return "rgba(255, 117, 98, 1)";
                }
            };
        },

        filteredItems() {
            let items;
            if (this.selectedCategory === "all") {
                items = Object.values(this.configData.items).flat();
            } else {
                items = this.configData.items[this.selectedCategory];
            }
            if (this.searchBlueprints.length > 0) {
                return items.filter(item => {
                    return (
                        String(item.name).toLowerCase().includes(this.searchBlueprints.toLowerCase()) ||
                        String(item.label).toLowerCase().includes(this.searchBlueprints.toLowerCase()) ||
                        String(item.time).toLowerCase().includes(this.searchBlueprints.toLowerCase()) ||
                        String(item.level).toLowerCase().includes(this.searchBlueprints.toLowerCase())
                    );
                });
            } else {
                return items;
            }
        },
        filterByTermLearnedData() {
            if (this.learnedSearchbarValue.length > 0) {
                if (!this.playerAccount.allData.learneddata || this.playerAccount.allData.learneddata.length === 0) {
                    return this.playerAccount.allData.learneddata;
                }
                
                let filteredData = this.playerAccount.allData.learneddata;
                
                if (!this.accessAnywhere) {
                    filteredData = filteredData.filter(data => 
                        this.configData.craftTableUniqueID.includes(data.craftTableID)
                    );
                }
                
                return filteredData.filter(data => {
                    const searchValue = this.learnedSearchbarValue.toLowerCase();
                    return (
                        String(data.name).toLowerCase().includes(searchValue) ||
                        String(data.label).toLowerCase().includes(searchValue) ||
                        String(data.time).toLowerCase().includes(searchValue) ||
                        String(data.level).toLowerCase().includes(searchValue)
                    );
                });                
            } else {
                if (this.accessAnywhere) {
                    return this.playerAccount.allData.learneddata;
                } else {
                    return this.playerAccount.allData.learneddata.filter(data => 
                        this.configData.craftTableUniqueID.includes(data.craftTableID)
                    );
                }                
            }
        },
        filterByTermHistoryData() {
            if (this.searchHistory.length > 0) {
                if (!this.playerAccount.allData.craftinghistorydata || this.playerAccount.allData.craftinghistorydata.length <= 0) {
                    return this.playerAccount.allData.craftinghistorydata;
                }
                return this.playerAccount.allData.craftinghistorydata.filter(name => {
                    return (
                        String(name.name).toLowerCase().includes(this.searchHistory.toLowerCase()) ||
                        String(name.label).toLowerCase().includes(this.searchHistory.toLowerCase()) ||
                        String(name.time).toLowerCase().includes(this.searchHistory.toLowerCase()) ||
                        String(name.result).toLowerCase().includes(this.searchHistory.toLowerCase())
                    );
                });
            } else {
                return this.playerAccount.allData.craftinghistorydata;
            }
        }
    }
});

app.use(store).mount("#app");
var resourceName = "codem-craftv2";

if (window.GetParentResourceName) {
    resourceName = window.GetParentResourceName();
}

window.postNUI = async (name, data) => {
    try {
        const response = await fetch(`https://${resourceName}/${name}`, {
            method: "POST",
            mode: "cors",
            cache: "no-cache",
            credentials: "same-origin",
            headers: {
                "Content-Type": "application/json"
            },
            redirect: "follow",
            referrerPolicy: "no-referrer",
            body: JSON.stringify(data)
        });
        return !response.ok ? null : response.json();
    } catch (error) {
        // console.log(error)
    }
};

function clicksound(val) {
    let audioPath = `./sound/${val}`;
    audioPlayer = new Howl({
        src: [audioPath]
    });
    audioPlayer.volume(0.4);
    audioPlayer.play();
}
