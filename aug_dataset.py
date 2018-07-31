import numpy as np
import torch.utils.data as data
import os
from os import path
import random
from torchvision import transforms
from PIL import Image
from batchup import data_source

def pil_loader(path):
        with open(path, 'rb') as f:
            img = Image.open(f)
            return img.convert('RGB')

normalize = transforms.Normalize(mean=[0.485, 0.456, 0.406],
                                 std=[0.229, 0.224, 0.225])
aug_transforms = transforms.Compose([
    transforms.Resize(160),
    transforms.ToTensor(),
    normalize
])


class Aug_Dataset(data.Dataset):
    def __init__(self, root, transforms=aug_transforms, target_only=False):
        self.root = root
        self.n = 8400
        self.transforms = transforms
        self.target_only = target_only

    def __len__(self):
        return self.n

    def getitem(self, index):
        p = path.join(self.root, 'img_{}'.format(index))
        if self.target_only:
                img_orig_p = path.join(p, 'img_{}_{}.png'.format(index, random.randint(1,10)))
        else:
                img_orig_p = path.join(p, 'img_{}_{}.png'.format(index, 0))
        img_style_p = path.join(p, 'img_{}_{}.png'.format(index, random.randint(1,10)))
        img_orig = pil_loader(img_orig_p)
        img_style = pil_loader(img_style_p)
        if self.transforms:
            img_orig, img_style = self.transforms(img_orig), self.transforms(img_style)
        return img_orig, img_style
    
    def __getitem__(self, item):
        if isinstance(item, int):
            return self.getitem(item)
        else:
            xs = []
            if isinstance(item, slice):
                indices = range(*item.indices(len(self)))
            elif isinstance(item, np.ndarray):
                indices = item
            else:
                raise TypeError('item should be an int/long, a slice or an array, not a {}'.format(
                    type(item)
                ))
            for i in indices:
                img = self.getitem(i)
                xs.append(img)
            return xs
        

if __name__ == '__main__':
    dataset = Aug_Dataset('/home/samlaf/augcyclegan/data')
    ds = data_source.ArrayDataSource([dataset], indices=np.arange(len(dataset)))
    for (batch,) in ds.batch_iterator(batch_size=2, shuffle=np.random.RandomState(12345)):
        print(batch)
        break
